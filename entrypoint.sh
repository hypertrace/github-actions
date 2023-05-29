#!/bin/sh -l

if [ -n "$4" -a -n "$5" -a -n "$6" -a -n "$7" ]; then
    helm repo add "$4" "$5" --username "$6" --password "$7"
fi

if [ $1 == "validate" ]; then
    echo "validating helm charts"
    helm dependency update $2
    helm lint --strict $2 $3
    helm template $2 $3

elif [ $1 == "publish" ]; then
    CHART_VERSION=$(echo ${GITHUB_REF} | cut -d/ -f 3)
    CHART_NAME=$(awk '/^name:/ {print $2}' $2/Chart.yaml)
    INPUT_REPOSITORY=$3
    INPUT_CREDENTIALS=$4
    export GOOGLE_APPLICATION_CREDENTIALS=${HOME}/helm-gcs-key.json

    echo ${INPUT_CREDENTIALS:-$HELM_GCS_CREDENTIALS} > ${GOOGLE_APPLICATION_CREDENTIALS}
    helm dependency update $2
    helm repo add helm-gcs ${INPUT_REPOSITORY:-$HELM_GCS_REPOSITORY}
    helm package --version ${CHART_VERSION} --app-version ${CHART_VERSION} $2
    helm gcs push ${CHART_NAME}-${CHART_VERSION}.tgz helm-gcs --public --retry
fi

import yaml
import sys

def check_pod_metadata(kind, name, template):
  if not 'metadata' in template:
    print(f'"metadata" is missing from {kind}/{name} template.')
    return False
  if not 'labels' in template['metadata']:
    print(f'"labels" is missing from {kind}/{name} metadata.')
    return False
  if not 'applicationid' in template['metadata']['labels']:
    print(f'commonPodLabels is missing from {kind}/{name} metadata.')
    return False
  if template['metadata']['labels']['applicationid'] != 'ABCD1234':
    print(f'commonPodLabels is not matching {kind}/{name} metadata.')
    return False
  if not 'annotations' in template['metadata']:
    print(f'"annotations" is missing from {kind}/{name} metadata.')
    return False
  if not 'traceable.ai/test' in template['metadata']['annotations']:
    print(f'commonPodAnnotations is missing from {kind}/{name} metadata.')
    return False
  if template['metadata']['annotations']['traceable.ai/test'] != '1234567890':
    print(f'commonPodAnnotations is not matching {kind}/{name} metadata.')
    return False
  return True

def check_pod_security_context(kind, name, template):
  spec = template['spec']
  if not 'securityContext' in spec:
    print(f'Pod security context is missing from {kind}/{name} spec.')
    return False
  security_context = spec['securityContext']
  # runAsUser
  if not 'runAsUser' in security_context:
    print(f'"runAsUser" is missing from {kind}/{name} pod security context.')
    return False
  if security_context['runAsUser'] != 55555:
    print(f'"runAsUser" is not matching in {kind}/{name} pod security context.')
    return False
  # fsGroup
  if not 'fsGroup' in security_context:
    print(f'"fsGroup" is missing from {kind}/{name} pod security context.')
    return False
  if security_context['fsGroup'] != 44444:
    print(f'"fsGroup" is not matching in {kind}/{name} pod security context.')
    return False
  # runAsNonRoot
  if not 'runAsNonRoot' in security_context:
    print(f'"runAsNonRoot" is missing from {kind}/{name} pod security context.')
    return False
  if security_context['runAsNonRoot'] != True:
    print(f'"runAsNonRoot" is not matching in {kind}/{name} pod security context.')
    return False
  return True

def check_container_security_context(kind, name, container):
  container_name = container['name']
  if not 'securityContext' in container:
    print(f'Container security context is missing from {kind}/{name}/{container_name} spec.')
    return False
  security_context = container['securityContext']
  # runAsUser
  if not 'runAsUser' in security_context:
    print(f'"runAsUser" is missing from {kind}/{name}/{container_name} container security context.')
    return False
  if security_context['runAsUser'] != 22222:
    print(f'"runAsUser" is not matching in {kind}/{name}/{container_name} container security context.')
    return False
  # runAsGroup
  if not 'runAsGroup' in security_context:
    print(f'"runAsGroup" is missing from {kind}/{name}/{container_name} container security context.')
    return False
  if security_context['runAsGroup'] != 333333:
    print(f'"runAsGroup" is not matching in {kind}/{name}/{container_name} container security context.')
    return False
  # runAsNonRoot
  if not 'runAsNonRoot' in security_context:
    print(f'"runAsNonRoot" is missing from {kind}/{name}/{container_name} container security context.')
    return False
  if security_context['runAsNonRoot'] != True:
    print(f'"runAsNonRoot" is not matching in {kind}/{name}/{container_name} container security context.')
    return False
  # allowPrivilegeEscalation
  if not 'allowPrivilegeEscalation' in security_context:
    print(f'"allowPrivilegeEscalation" is missing from {kind}/{name}/{container_name} container security context.')
    return False
  if security_context['allowPrivilegeEscalation'] != False:
    print(f'"allowPrivilegeEscalation" is not matching in {kind}/{name}/{container_name} container security context.')
    return False
  return True

def check_helm_template(doc):
  validated = True
  kind = doc['kind']
  name = doc['metadata']['name']
  print(f'\nchecking {kind}/{name} template.')
  if kind in  ['Deployment', 'StatefulSet', 'Job']:
      template = doc['spec']['template']
  if kind in  ['CronJob']:
      template = doc['spec']['jobTemplate']['spec']['template']
  if not check_pod_metadata(kind, name, template):
    validated = False
  if not check_pod_security_context(kind, name, template):
    validated = False
  containers = template['spec']['containers']
  for container in containers:
    if not check_container_security_context(kind, name, container):
      validated = False
  if 'initContainers' in template['spec']:
    for container in template['spec']['initContainers']:
      if not check_container_security_context(kind, name, container):
        validated = False
  print(f'validated: {validated}')
  return validated

filepath = sys.argv[1]
validated = True
with open(filepath, 'r') as fd:
  docs = yaml.safe_load_all(fd)
  for doc in docs:
    if doc['kind'] in ['Deployment', 'StatefulSet', 'Job', 'CronJob']:
      if not check_helm_template(doc):
        validated = False

if not validated:
  sys.exit(1)

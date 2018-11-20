# Kubernetes Orb

Common tasks for deploying demo installations into Kubernetes cluster.

## Job 'deploy-demo'

Deploys demo installation to Kubernetes cluster using `continuous-delivery` branch.

### Usage

Add orb to circleci config in your directory:

```
version: 2.1

orbs:
  kubernetes: opuscapita/kubernetes@volatile
```

Use `deploy-demo` job in a workflow:

```
workflows:
  version: 2
  common:
    jobs:
      - kubernetes/deploy-demo
```

* Make sure `Enable build processing` is `On` in `https://circleci.com/gh/OpusCapita/REPOSITORY_NAME/edit#advanced-settings` in order to use `orbs`, otherwise build will fail.

### Requirements
- access to [OpusCapita/machineuser-vault](https://github.com/OpusCapita/machineuser-vault) repository
- `MACHINEUSER_VAULT_KEY` in build environment
- 'continuous-delivery' branch is set up in repository being built

### How it works
- logs into cluster
- creates a `namespace` for deployment
- copies over required secrets (`imagePullSecret`, `machineuser-vault`, `tls` certificates)
- runs `helm upgrade --install` with chart defined in `continuous-delivery` branch
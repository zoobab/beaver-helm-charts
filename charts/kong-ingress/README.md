# kong-ingress

[kong-ingress](https://github.com/kubernetes/ingress-nginx) is an Ingress controller based on Kong.

To use, add the `kubernetes.io/ingress.class: nginx` annotation to your Ingress resources.

## TL;DR;

```console
$ helm repo add wildbeavers https://wildbeavers.github.io/beaver-helm-charts/
$ helm install wildbeavers/kong-ingress
```

## Introduction

This chart bootstraps an kong-ingress deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites
  - Kubernetes 1.10+

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm install --name my-release wildbeavers/kong-ingress
```

The command deploys kong-ingress on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the kong-ingress chart and their default values.

Parameter | Description | Default
--- | --- | ---
`replicaCount` | desired number of controller pods | `1`
`namespace` | controller namespace | `kong`
`kong.image.repository` | kong container image repository | `kong`
`kong.image.tag` | kong container image tag | `0.13.1-centos`
`kong.image.pullPolicy` | kong container image pull policy | `IfNotPresent`
`kong.service.type` | type of controller service to create | `NodePort`
`kong.service.loadBalancerIP` | IP address to assign to load balancer (if supported) | `""`
`kong.service.http_port` | HTTP port | `80`
`kong.service.https_port` | HTTPS port | `443`
`ingress.image.repository` | ingress container image repository | `kong-docker-kubernetes-ingress-controller.bintray.io/kong-ingress-controller`
`ingress.image.tag` | ingress container image tag | `0.0.4`
`ingress.image.pullPolicy` | ingress container image pull policy | `IfNotPresent`
`ingress.service.type` | type of ingress admin service to create | `NodePort`
`ingress.service.loadBalancerIP` | IP address to assign to admin service load balancer (if supported) | `""`
`ingress.service.port` | admin service port | `8001`
[all postgres values](https://github.com/kubernetes/charts/tree/master/stable/postgresql)
`postgres.postgresUser` | postgres database user | `kong`
`postgres.postgresPassword` | postgres database password | `random 10 characters`
`postgres.postgresDatabase` | postgres database name | `kong`
`postgres.persistence.enabled` | postgres database persistence | `true`
`postgres.persistence.storageClass` | postgres storage class | `"-"`
`postgres.metrics.enabled` | enable Prometheus metrics for postgres | `false`
`postgres.image.repository` | postgres container image repository | `postgres`
`postgres.image.tag` | postgres container image tag | `9.5`
`postgres.image.pullPolicy` | postgres container image pull policy | `IfNotPresent`
`customtypes.enabled` | enable CustomResourceDefinitions - If you deploy multiple ingress controllers to your cluster, those have to be deployed only once. | `true`
`resources` | pod resource requests & limits | `{}`
`nodeSelector` | node labels for pod assignment | `{}`
`tolerations` | node taints to tolerate | `[]`
`affinity` | node/pod affinities | `{}`

```console
$ helm install wildbeavers/kong-ingress --name my-release \
    --set controller.stats.enabled=true
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```console
$ helm install wildbeavers/kong-ingress --name my-release -f values.yaml
```


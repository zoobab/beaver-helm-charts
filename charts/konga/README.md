# konga ui

[konga](https://github.com/pantsel/konga) is an UI based on Kong.


## TL;DR;

```console
$ helm repo add wildbeavers https://wildbeavers.github.io/beaver-helm-charts/
$ helm install wildbeavers/konga
```

## Introduction

This chart bootstraps an konga ui.

## Prerequisites
  - Kubernetes 1.10+

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm install --name my-release wildbeavers/konga
```

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
`konga.image.repository` | kong container image repository | `kong`
`konga.image.tag` | kong container image tag | `0.13.1-centos`
`konga.image.pullPolicy` | kong container image pull policy | `IfNotPresent`

```console
$ helm install wildbeavers/kong-ingress --name my-release \
    --set controller.stats.enabled=true
```

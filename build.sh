#!/usr/bin/env bash
set -euo pipefail

helm package -u -d docs charts/*
helm repo index docs --url https://wildbeavers.github.io/beaver-helm-charts/
cat << EOF > docs/index.md
---
layout: default
---

EOF
grep -h "name: " charts/*/Chart.yaml | sed 's|name: \(.*\)| * [\1](https://github.com/WildBeavers/beaver-helm-charts/tree/master/charts/\1/)|' >> docs/index.md

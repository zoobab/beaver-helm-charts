[![noswpatv3](http://zoobab.wdfiles.com/local--files/start/noupcv3.jpg)](https://ffii.org/donate-now-to-save-europe-from-software-patents-says-ffii/)
[![noswpatv3](http://zoobab.wdfiles.com/local--files/start/noupcv3.jpg)](https://ffii.org/donate-now-to-save-europe-from-software-patents-says-ffii/)
# Wild Beaver Helm Charts

Custom [Helm](https://www.helm.sh/) charts.

## Add Helm Repo for wildbeavers

### 1.

```
helm repo add wildbeavers https://wildbeavers.github.io/beaver-helm-charts/
```

### 2.

Execute build.sh und commit & push the changes to "activate" your chart
```
./build.sh && git commit -m "add browsermob-selenium" && git push
```

# Konga notes

Step 1: create a namespace named "mykong"

Problem 1: helm throws an error like ```dial tcp 172.30.0.1:443: connect: network is unreachable```:

```
[tiller] 2019/03/06 13:55:57 failed install prepare step: Get https://172.30.0.1:443/version?timeout=32s: dial tcp 172.30.0.1:443: connect: network is unreachable
[tiller] 2019/03/06 13:56:01 preparing install for kong
```

Solution 1: tiller needs more rights:

```
oc create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=system:serviceaccount:mykong:default
```

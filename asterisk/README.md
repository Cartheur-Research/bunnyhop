## Building and deploying asterisk

Use VSCode or cmder to build the asterisk image:

* `cd build`
* `docker build -t cartheur/asterisk .`

Navigate to the [k8s](/k8s/README.md) directory to run it in conjunction with:

* [Prometheus](https://github.com/prometheus/prometheus)
* [Alert](https://github.com/prometheus/alertmanager) manager
* [Grafana](https://github.com/grafana/grafana)
* Grafana [docker](https://github.com/grafana/grafana/tree/master/packaging/docker)
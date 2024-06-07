## Building and deploying asterisk

Use VSCode or cmder to build the asterisk image:

* `cd build`
* `docker build -t cartheur/asterisk .`

If trying to sort modules - both in terms of configuration and installing - use:

* `docker build --no-cache -t cartheur/asterisk .`

Navigate to the [k8s](/k8s/README.md) directory to run it in conjunction with:

* [Prometheus](https://github.com/prometheus/prometheus)
* [Alert](https://github.com/prometheus/alertmanager) manager
* [Grafana](https://github.com/grafana/grafana)
* Grafana [docker](https://github.com/grafana/grafana/tree/master/packaging/docker)

## Configuration

Always the most difficult part of the process. Given the depreciation in Version 21, [this](https://docs.asterisk.org/Configuration/Channel-Drivers/SIP/Configuring-res_pjsip/Migrating-from-chan_sip-to-res_pjsip/) article will help.
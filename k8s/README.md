## The asterisk k8s rig

Asterisk is better with k8s, so setting up a rig to manage the entirety.

### Build custom asterisk

`docker build -t cartheur/asterisk .`

### Manually create a volume on the first-go

`docker volume create grafana-data`

### Launch the rig

* `cd k8s`
* `docker-compose up`
## The asterisk k8s rig

Asterisk is better with k8s, so setting up a rig to manage the entirety.

### Build custom asterisk

`docker build -t cartheur/asterisk .`

### Prometheus commands

Use `docker-compose up`

### Grafana dashboard

Use `docker volume create grafana-data`
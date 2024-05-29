## The asterisk k8s rig

Asterisk is better with k8s, since we can manage its resources and state using autonomous tools.

### Post-Build asterisk and monitoring

After having built the asterisk image, prepare monitoring by manually-creating the Grafana volume as a part of the setup:

`docker volume create grafana-data`

Now you are ready to launch the system:

* `cd k8s`
* `docker-compose up`

Configure the ports in the `yaml` files in the appropriate places.

_Final steps_

* Todo: Asterisk client setup and configuration.
* Enjoy secure communication.
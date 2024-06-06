[![GitHub license](https://img.shields.io/github/license/cartheur-research/bunnyhop)](https://github.com/cartheur-research/bunnyhop/blob/main/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/cartheur-research/bunnyhop)](https://github.com/cartheur-research/bunnyhop/issues)

## bunnyhop secure conferencing

Audio/Video streaming meeting software that is secure and encrypted end-to-end. For our use-case, it is important to have meetings with clients in a secure manner so that sensitive IP and other matters is not prone to leakage. This gives a greater confidence in delivery of our products and services.

_Background_

Bunnyhop is a form of skill-based movement that's been present in many games and game engines; it's performed by repeating jumps in order to gain velocities higher than are possible by normal movement.

_Strategy_

Bunnyhop uses [asterisk](https://github.com/Cartheur-Research/asterisk) to perform the magic. But we don't want to only use this as a single-instance container. Rather, as part of a Kubernetes rig. The first thing to do is go to the asterisk [ReadMe](/asterisk/README.md).

_Development status_

Kuberentes system running without errors or warnings. Next step is to configure the callers for asterisk.
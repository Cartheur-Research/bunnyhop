## bunnyhop secure conferencing

Audio/Video streaming meeting software that is secure and encrypted end-to-end.

_Background_

Bunnyhop is a form of skill-based movement that's been present in many games and game engines since before 2000. It's performed by repeating jumps in order to gain velocities higher than are possible by normal movement.

_Strategy_

Use VSCode to build the asterisk image:

`cd build`
`docker build -t cartheur/asterisk .`

And a terminal to run the container

* `cd host`
* `docker-compose up`
* `docker run -it cartheur/asterisk`

_Development status_

Container running without errors or warnings.
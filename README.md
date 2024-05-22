## bunnyhop secure conferencing

Audio/Video streaming meeting software that is secure and encrypted end-to-end.

_Background_

Bunnyhop is a form of skill-based movement that's been present in many games and game engines since before 2000. It's performed by repeating jumps in order to gain velocities higher than are possible by normal movement.

### Building asterisk

`cd build`
`docker build -t cartheur/asterisk .`

### Running asterisk

`docker run -v "./pulse:/etc/asterisk" -it cartheur/asterisk`

_Development status_

Container running, errors with `conf` files.
# freighter (Docker + Freight-Server)
Self-contained cache server for 'freight-server' NPM package, providing NPM install acceleration.

Container installs:
- Latest supported NodeJS 5.x
- Redis
- Various supporting requirements

## Usage
The container exposes a single port 8872, which can be exported or linked to
from other containers.

On first startup, use docker logs (container-name) to find out what your freight-server
password is. 


## Feature Todo List
I'd happily accept pull requests for any of the following:

- Set the initial password via an environment variable (requires
dynamically writing out a config file and a bit of sed work)

Other suggestions also welcome, but this is primarily a docker container
of personal convienience.
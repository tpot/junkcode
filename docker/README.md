# Docker

## Dockerfiles

### `Dockerfile.tcpdump`

Ubuntu 20.04 with tcpdump, tshark and miscellaneous other networking
tools installed.
```
$ docker build -t tpot/tcpdump -f Dockerfile.tcpdump .
```

### `Dockerfile.apt-file`

Ubuntu 20.04 with apt-file installed and `apt-file update`
executed. Should be refreshed every so often to pick up any new
packages and remove any out of date junk.
```
$ docker build -t tpot/apt-file -f Dockerfile.apt-file .
```

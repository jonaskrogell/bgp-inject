# bgp-inject
Docker containted script that will inject a copy of a BGP table downloaded from RIPE RIS project.

# Download and run from hub.docker.com
`docker run --detach --restart always --name bgp-injector --publish 179:179 -e PEERIP=192.168.200.230 -e ASN=64512 jonaskrogell/bgp-inject:latest`

# Or manually building and running the container

## Build command
`docker build -t bgp-inject https://github.com/jonaskrogell/bgp-inject.git`

## Start docker container in background with a automatic restart policy
`docker run --detach --restart always --name bgp-injector --publish 179:179 -e PEERIP=192.168.200.230 -e ASN=64512 bgp-inject`

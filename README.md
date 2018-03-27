# bgp-inject
Docker containted script that will inject a copy of a BGP table downloaded from RIPE RIS project.

# Build command
`docker build -t bgp-inject https://github.com/jonaskrogell/bgp-inject.git`

# Start docker container in foreground
`docker run --name bgp-injector --publish 139:139 -e PEERIP=192.168.200.230 -e ASN=64512 bgp-inject`

# Install as service
`docker service create --name bgp-injector --publish 139:139 -e PEERIP=192.168.200.230 -e ASN=64512 bgp-inject`

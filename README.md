# bgp-inject
Docker containted script that will inject a copy of a BGP table downloaded from RIPE RIS project.

# Build command
`docker build -t bgp-inject https://github.com/jonaskrogell/bgp-inject.git`

# Run command
`docker run -d --name bgp-injector --restart unless-stopped -e PEERIP=192.168.200.230 -e ASN=64512 bgp-inject`

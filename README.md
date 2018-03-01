# bgp-inject
Docker containted script that will inject a copy of a BGP table downloaded from RIPE RIS project.

# Build command
`docker build -t bgp-inject https://github.com/jonaskrogell/bgp-inject`

# Run command
`docker run -d --name bgp-injector --restart unless-stopped bgp-inject`

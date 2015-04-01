#!/bin/bash

# Launch a seeder
docker run -v $PWD/leecher/downloads:/var/lib/transmission-daemon/downloads -p 12345:12345 -p 12345:12345/udp -e PEER_PORT=12345 -d quay.io/jzelinskie/chihaya-demo
sleep 60

# Launch 9 leechers
docker run -p 12346:12346 -p 12346:12346/udp -e PEER_PORT=12346 -d quay.io/jzelinskie/chihaya-demo
docker run -p 12347:12347 -p 12347:12347/udp -e PEER_PORT=12347 -d quay.io/jzelinskie/chihaya-demo
docker run -p 12348:12348 -p 12348:12348/udp -e PEER_PORT=12348 -d quay.io/jzelinskie/chihaya-demo
docker run -p 12349:12349 -p 12349:12349/udp -e PEER_PORT=12349 -d quay.io/jzelinskie/chihaya-demo
docker run -p 12350:12350 -p 12350:12350/udp -e PEER_PORT=12350 -d quay.io/jzelinskie/chihaya-demo
docker run -p 12351:12351 -p 12351:12351/udp -e PEER_PORT=12351 -d quay.io/jzelinskie/chihaya-demo
docker run -p 12352:12352 -p 12352:12352/udp -e PEER_PORT=12352 -d quay.io/jzelinskie/chihaya-demo
docker run -p 12353:12353 -p 12353:12353/udp -e PEER_PORT=12353 -d quay.io/jzelinskie/chihaya-demo
docker run -p 12354:12354 -p 12354:12354/udp -e PEER_PORT=12354 -d quay.io/jzelinskie/chihaya-demo

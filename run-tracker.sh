# Start Tracker
docker run -p 6881:6881 -v $PWD/config:/config --name chihaya -d quay.io/jzelinskie/chihaya

# Generate a torrent file with the container's IP as the tracker
python change_tracker_url.py $(docker inspect --format '{{ .NetworkSettings.IPAddress }}' chihaya)


# Build a new peer
cd peer
docker build -t quay.io/jzelinskie/chihaya-peer .

# Spawn a seeder
#cd ..
#docker run -v $PWD/downloads:/var/lib/transmission-daemon/downloads -d quay.io/jzelinskie/chihaya-peer
#sleep 20

# Spawn some leechers
docker run -d quay.io/jzelinskie/chihaya-peer
#docker run -d quay.io/jzelinskie/chihaya-peer
#docker run -d quay.io/jzelinskie/chihaya-peer

import transmissionrpc
import time
import requests
import uuid

STATUS_ENDPOINT = 'http://192.168.59.3:5000/update'
UUID = str(uuid.uuid4())

def main():
  # Connect to Transmission.
  client = transmissionrpc.Client(user='transmission', password='password')
  client.set_session(dht_enabled=False)

  # Add our torrent and start it.
  client.add_torrent('file:///new.torrent')
  client.start_all()
  start_time = time.time()

  # Monitor the progress and post it to an HTTP endpoint.
  progress = get_progress(client)
  while progress < 100:
    update_progress(progress)
    time.sleep(1)
    progress = get_progress(client)

  # Update the progress one last time and then calculate the total time it took
  # and post that to an HTTP endpoint.
  update_progress(progress)
  finished(start_time)

  # Block while seeding
  while True:
    time.sleep(10)

def get_progress(client):
  torrent = client.get_torrents()[0]
  return torrent.progress

def update_progress(progress):
  requests.post(STATUS_ENDPOINT, data={'progress': progress, 'uuid': UUID})

def finished(start_time):
  time_diff = time.time() - start_time
  requests.post(STATUS_ENDPOINT, data={'time': time_diff, 'uuid': UUID})

if __name__ == '__main__':
  main()

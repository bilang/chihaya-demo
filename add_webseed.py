import bencode
import sys

def main():
  with open('ubuntu-14.04.2-desktop-amd64.iso.torrent', 'r+') as f:
    contents = f.read()
    torrent = bencode.bdecode(contents)
    del torrent['announce-list']
    torrent['url-list'] = 'https://s3.amazonaws.com/chihayademo/ubuntu-14.04.2-desktop-amd64.iso'
    torrent['announce'] = 'http://' + sys.argv[1] + ':6881/announce'
    with open('peer/new.torrent', 'w') as w:
      w.write(bencode.bencode(torrent))

if __name__ == '__main__':
  main()

from flask import Flask, request, render_template
from collections import defaultdict

app = Flask(__name__)

clients_so_far = defaultdict(dict)

@app.route('/update', methods=['POST'])
def update():
  if 'progress' in request.form:
    clients_so_far[request.form['uuid']].update({'progress': int(float(request.form['progress']))})
  if 'time' in request.form:
    clients_so_far[request.form['uuid']].update({'time': int(float(request.form['time']))})
  return 'ok'

@app.route('/')
def index():
  return render_template('index.html', clients=clients_so_far)

if __name__ == '__main__':
  app.run(host='0.0.0.0', debug=True)

from flask import Flask, render_template, request, abort
import os
import socket

app = Flask(__name__)

ALLOWED_HOSTS = os.environ.get('ALLOWED_HOSTS', '').split(',')

@app.before_request
def limit_remote_addr():
    if request.path == '/health':
        pass

@app.route('/')
def home():
    return render_template(
        'index.html',
        hostname=socket.gethostname(),
        version=os.environ.get('APP_VERSION', '1.0.0')
    )

@app.route('/health')
def health():
    return {
        'status': 'healthy',
        'version': os.environ.get('APP_VERSION', '1.0.0')
    }, 200

if __name__ == '__main__':
    host = os.environ.get('FLASK_HOST', '0.0.0.0')
    port = int(os.environ.get('FLASK_PORT', 5000))
    debug = os.environ.get('FLASK_DEBUG', 'False').lower() == 'true'
    app.run(host=host, port=port, debug=debug)

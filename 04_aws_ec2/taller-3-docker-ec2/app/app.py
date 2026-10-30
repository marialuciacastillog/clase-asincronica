import socket
from datetime import datetime

from flask import Flask

app = Flask(__name__)


def hostname_ec2():
    # /etc/hostname de la EC2, montado en el contenedor desde el docker-compose.yml
    with open("/host_hostname") as f:
        return f.read().strip()


@app.get("/")
def home():
    return {
        "message": "Hola desde EC2",
        "hostname_contenedor": socket.gethostname(),
        "hostname_ec2": hostname_ec2(),
        "hora": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
    }


@app.get("/health")
def health():
    return {"status": "ok"}


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

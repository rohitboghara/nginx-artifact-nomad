# 🌐 Nginx Artifact Nomad

This repository contains a single static HTML file:

* index.html — Simple static web page used for testing, Nginx, or Nomad deployment.

---

## 🚀 Run Locally

1. Clone the repository:
   git clone [https://github.com/rohitboghara/nginx-artifact-nomad.git](https://github.com/rohitboghara/nginx-artifact-nomad.git)
   cd nginx-artifact-nomad

2. Start local server:
   python3 -m http.server 8000

---

## 🌍 Access the Page

Local machine:
[http://localhost:8000/index.html](http://localhost:8000/index.html)

Same network device:
http://<server-ip>:8000/index.html

Example:
[http://192.168.1.20:8000/index.html](http://192.168.1.20:8000/index.html)

---

## 📁 Folder Structure

nginx-artifact-nomad/
• index.html
• nginx-artifact.nomad

---

## 📦 Run with Nomad

Nomad job run command:

nomad job run nginx-artifact.nomad

Check job status:
nomad job status nginx-artifact

Check logs:
nomad alloc logs <alloc-id>

---

# 📄 nginx-artifact.nomad (FULL CONTENT)

job "nginx-artifact" {
datacenters = ["dc1"]
type        = "service"

group "web" {
count = 1

```
network {
  port "http" {
    to = 80
  }
}

artifact {
  source      = "https://github.com/rohitboghara/nginx-artifact-nomad/archive/refs/heads/main.zip"
  destination = "local/"
}

task "nginx" {
  driver = "docker"

  config {
    image = "nginx:latest"
    ports = ["http"]
    volumes = ["local/nginx-artifact-nomad-main:/usr/share/nginx/html"]
  }

  resources {
    cpu    = 200
    memory = 128
  }
}
```

}
}

---

## 🛠 Requirements

• Python 3
• Nomad + Docker
• Browser

---



job "nginx-artifact" {
  datacenters = ["dc1"]
  type = "service"

  group "web" {
    network {
      port "http" {
        to = 80
      }
    }

    task "nginx" {
      driver = "docker"

      # Download the artifact into the allocation under "local/www/"
      artifact {
        source      = "http://10.54.19.217:8000/index.html"  # <-- change to your server URL
        destination = "local/www/"                        # relative inside $NOMAD_ALLOC_DIR
      }

      config {
        image = "nginx:latest"
        volumes = [
          "local/www:/usr/share/nginx/html:ro"
        ]
        ports = ["http"]
      }

      resources {
        cpu    = 500
        memory = 256
      }
    }
  }
}


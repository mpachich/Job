variable "kubernetes_ip" {
  description = "Address of kubernetes cluster"
  default     = "https://192.168.99.100:8443"
}

variable "k8s_client_certificate" {
  description = "Client certificate"
}

variable "k8s_client_key" {
  description = "Client key"
}

variable "k8s_client_ca_certificate" {
  description = "Client CA certificate"
}

variable "k8s_config" {
  description = "Config file"
}

provider "kubernetes" {
  host = "${var.kubernetes_ip}"

  # username               = "admin"
  config_context_cluster = "mycluster.icp"
  token                  = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdF9oYXNoIjoiY3E3bW9lZDJqdGNwajZoZjgzbXIiLCJyZWFsbU5hbWUiOiJjdXN0b21SZWFsbSIsInVuaXF1ZVNlY3VyaXR5TmFtZSI6ImFkbWluIiwiaXNzIjoiaHR0cHM6Ly9teWNsdXN0ZXIuaWNwOjk0NDMvb2lkYy9lbmRwb2ludC9PUCIsImF1ZCI6IjIxNDQzMjFlZTJiZjViNDdlY2ZlYjk2OGFjYWM0MmQ0IiwiZXhwIjoxNTM3NDIyMjA3LCJpYXQiOjE1Mzc0MjIyMDcsInN1YiI6ImFkbWluIiwidGVhbVJvbGVNYXBwaW5ncyI6W119.FNCXK9iQF3_0DtrSp3PkSSb443vtaEUyAXg133XHX7SyRSmXclwuq8H8txcaQXAt4Sd18_3Vt_IK4p-fHmqNs43zjxU9w_NCLrGPreJwtEg-RcXGD-QEgZIjwSakuuFgOCu5nbsboXe6nrTONj8UlGOicKkRDRW0hBWEYyE1vSEV30UDObZwN6ncZaYF7lhM69usBIQwaJ4b4t51DKHr5eRO8aQwhFWRs9DQ3o8yE6FEkm_kEW7w85ldBcanZGk4_cLXw9dKKwSHp7gW_sV5AEXkE6UPGScwr7t5ljnR1yRaiF8WSln0b4VPJCyzjTxkYX6xr3iJ3vnYq2SdZOmu8A"

  # client_key             = "${var.k8s_client_key}"
  # cluster_ca_certificate = "${var.k8s_client_ca_certificate}"
  # client_certificate     = "${var.k8s_client_certificate}"
  # config_path = "${var.k8s_config}"

  insecure = "true"

  # token=""
}

resource "kubernetes_pod" "jenkins" {
  metadata {
    name = "jenkins-example"

    labels {
      App = "jenkins"
    }
  }

  spec {
    container {
      image = "mpachich/terrafor-jenkins:1"
      name  = "example"

      port {
        container_port = 80
      }
    }
  }
}

# provider "jenkins" {
#   server_url = "http://localhost:8080/"
#   username   = "user1"
#   password   = "user1"
# }


# resource "jenkins_job" "first" {
#   name         = "TerrTest"
#   display_name = "First terraform test"
#   description  = "This makes a project using terraform"
#   disabled     = false


#   parameters = {}
#   template   = "file://./job_config.xml"
# }


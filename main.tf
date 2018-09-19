variable "kubernetes_ip" {
  description = "Address of kubernetes cluster"

  # default     = "https://192.168.99.100:8443"
}

# variable "k8s_client_certificate" {
#   description = "Client certificate"
# }

# variable "k8s_client_key" {
#   description = "Client key"
# }

# variable "k8s_client_ca_certificate" {
#   description = "Client CA certificate"
# }

# variable "k8s_config" {
#   description = "Config file"
# }

variable "k8s_token" {
  description = "Token of your service account"

  # default     = "default value"
}

provider "kubernetes" {
  host = "${var.kubernetes_ip}"

  # username               = "admin"
  config_context_cluster = "mycluster.icp"
  token                  = "${var.k8s_token}"

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


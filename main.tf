variable "kubernetes_ip" {
  description = "Address of kubernetes cluster"
  default     = "https://192.168.99.100:8443"
}

provider "kubernetes" {
  host = "${var.kubernetes_ip}"

  # client_certificate = "${file("/home/manan/.minikube/client.crt")}"
  # client_key         = "${file("/home/manan/.minikube/client.key")}"

  # cluster_ca_certificate = "${file("/home/manan/.minikube/ca.crt")}"
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


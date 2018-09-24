resource "aws_service_discovery_service" "fargate" {
  name = "${var.environment}"
  dns_config {
    namespace_id = "${var.service_discovery_namespace}"
    routing_policy = "MULTIVALUE"
    dns_records {
      ttl = 10
      type = "A"
    }

    dns_records {
      ttl  = 10
      type = "SRV"
    }
  }
  health_check_custom_config {
    failure_threshold = 5
  }
}

variable "service_discovery_namespace" {}

output "discovery_dns" {
  value="${var.environment}.${var.app}.turnerapps.com"
}

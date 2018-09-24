resource "aws_service_discovery_public_dns_namespace" "fargate" {
  name = "${var.app}.turnerapps.com"
  description = "Fargate discovery managed zone."
}

output "namespace" {
  value = "${aws_service_discovery_public_dns_namespace.fargate.id}"
}

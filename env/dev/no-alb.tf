resource "aws_security_group_rule" "nsg_task_ingress_rule_noalb" {
  description              = "Allow connections to tasks on port ${var.container_port}"
  type                     = "ingress"
  from_port                = "${var.container_port}"
  to_port                  = "${var.container_port}"
  protocol                 = "TCP"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.nsg_task.id}"
}

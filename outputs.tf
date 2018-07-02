output "vpc_id" {
  value = "${module.network.vpc_id}"
}

output "vpc_cidr" {
  value = "${module.network.vpc_cidr}"
}

output "public_subnet_ids" {
  value = "${module.network.public_subnet_ids}"
}

output "private_subnet_ids" {
  value = "${module.network.private_subnet_ids}"
}

output "ephemeral_subnet_ids" {
  value = "${module.network.ephemeral_subnet_ids}"
}

output "aws_security_group_allow_ssh_anywhere_id" {
  value = "${aws_security_group.allow_ssh_anywhere.id}"
}
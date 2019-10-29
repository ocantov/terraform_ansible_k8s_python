
output "k8s-pub-subnets-ids" {
  value = [aws_subnet.k8s_pub_subnets.*.id]
}


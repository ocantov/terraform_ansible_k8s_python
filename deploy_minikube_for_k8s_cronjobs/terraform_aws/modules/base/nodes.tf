
resource "aws_instance" "name" {
  ami                         = var.k8s_masters_ami_id
  instance_type               = var.k8s_masters_instance_type
  #security_groups             = flatten([aws_security_group.k8s_masters_sg.id])
  vpc_security_group_ids      = flatten([aws_security_group.k8s_masters_sg.id])
  subnet_id                   = aws_subnet.k8s_pub_subnets.0.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.k8s_dev_ssh_key.id

  tags = map(
        "Name", join("_",[var._environment,"k8s"]),)


  depends_on                  = ["aws_security_group.k8s_masters_sg", "aws_key_pair.k8s_dev_ssh_key"]
}

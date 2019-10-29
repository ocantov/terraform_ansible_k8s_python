
##ssh key for nodes
resource "aws_key_pair" "k8s_dev_ssh_key" {
  key_name      = var.ssh_key_name
  public_key    = var.ssh_key

}


## Security Group for K8S Masters
resource "aws_security_group" "k8s_minikube_sg" {
  name                        = join("_",[var._environment,var.cluster_name,"minikube_sg"])
  vpc_id                      = aws_vpc.k8s_vpc.id
  tags                        = map(
                                   "Name", join("_",[var._environment,"minikube_sg"])
                                  )
}


## Allow traffic within the security group
resource "aws_security_group_rule" "k8s_masters_allow_self_ingress" {
  type                      = "ingress"
  from_port                 = 0
  to_port                   = 0
  protocol                  = "-1"
  self                      = true
  security_group_id         = aws_security_group.k8s_minikube_sg.id
}

## Allow SSH traffic instances in the VPC
resource "aws_security_group_rule" "k8s_masters_allow_ingress_ssh" {
  count                   = length(var.allowed_publicIPs)
  type                    = "ingress"
  from_port               = "22"
  to_port                 = "22"
  protocol                = "tcp"
  cidr_blocks             = flatten([element(var.allowed_publicIPs, count.index)])
  security_group_id       = aws_security_group.k8s_minikube_sg.id
}

## Allow all outbound traffic
resource "aws_security_group_rule" "k8s_masters_allow_egress_traffic" {
  type                    = "egress"
  from_port               = 0
  to_port                 = 0
  protocol                = "-1"
  cidr_blocks             = ["0.0.0.0/0"]
  security_group_id       = aws_security_group.k8s_minikube_sg.id
}

## Allow HTTP traffic from known public IPs
resource "aws_security_group_rule" "masters_allow_http_traffic" {
  count                   = length(var.allowed_publicIPs)
  type                    = "ingress"
  from_port               = "443"
  to_port                 = "443"
  protocol                = "tcp"
  cidr_blocks             = flatten([element(var.allowed_publicIPs, count.index)])
  security_group_id       = aws_security_group.k8s_minikube_sg.id
}
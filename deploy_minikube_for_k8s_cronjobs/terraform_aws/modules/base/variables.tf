
variable "profile" {
  description = "AWS API key credentials to use"
  type = string
}

variable "region" {
  description = "AWS Region the infrastructure is hosted in"
  type = string
}

variable "vpc_cidr" {
  description = "The VPC CIDR range"
}

variable "cluster_name" {
  description = "The name of the cluster_name/App to run on this VPC"
}

variable "_environment" {
  description = "The name of the cluster_name/App to run on this VPC"
}

variable "k8s_pub_subnets_cidrs" {
  description = "The CIDR ranges of private subnets"
  type        = list(string)
}

variable "av_zones" {
  description = "The Availability Zones to use for indicated region"
  type        = list(string)
}

variable "k8s_masters_ami_id" {
   type        = string
}

variable "k8s_masters_instance_type" {
   type        = string
}

variable "ssh_key_name" {
   type        = string
}

variable "ssh_key" {
   type        = string
}

variable "allowed_publicIPs" {
  type         = list(string)
}


variable "k8s_pub_subnets_ids" {
  
}

variable "s3bucket_name" {
   type       = string
}

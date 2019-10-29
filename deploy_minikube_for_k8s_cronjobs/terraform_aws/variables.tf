variable "profile" {
  description = "The AWS profile to use for API calls"
  type = string
}

variable "region" {
  description = "The AWS Region to deploy the infrastructure in"
  type = string
}

variable "av-zones" {
  description = "The Availability Zones to use for indicated region"
  type        = list(string)
}

variable "vpc-cidr" {
  description = "The CIDR range for the VPC"
  type = string
}

variable "cluster-name" {
  description = "The name of the cluster_name/App to deploy in this VPC"
  type = string
}
variable "environment" {
  description = "The name of the env/App to deploy in this VPC"
  type = string
}

variable "k8s-pub-subnets-cidrs" {
  description = "The CIDR ranges of private subnets"
  type        = list(string)
}

variable "allowed-publicIPs" {
  type        = list(string)
  
}

variable "k8s-masters-ami-id" {
   type        = string
}


variable "k8s-masters-instance-type" {
   type        = string
}

variable "ssh-key-name" {
     type        = string
}

variable "ssh-key" {
     type        = string
}

variable "s3bucket-name" {
   type          = string
  
}


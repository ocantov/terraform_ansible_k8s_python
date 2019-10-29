module "base" {
    source = "./modules/base"
    profile                     = var.profile
    region                      = var.region
    av_zones                    = var.av-zones
    vpc_cidr                    = var.vpc-cidr
    cluster_name                = var.cluster-name
    _environment                = var.environment
    k8s_pub_subnets_cidrs       = var.k8s-pub-subnets-cidrs
    k8s_masters_ami_id          = var.k8s-masters-ami-id               
    k8s_masters_instance_type   = var.k8s-masters-instance-type
    ssh_key_name                = var.ssh-key-name
    ssh_key                     = var.ssh-key
    allowed_publicIPs           = var.allowed-publicIPs
    k8s_pub_subnets_ids         = [module.base.k8s-pub-subnets-ids]
    s3bucket_name               = var.s3bucket-name    
} 
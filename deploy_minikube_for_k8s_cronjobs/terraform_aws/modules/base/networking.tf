resource "aws_vpc" "k8s_vpc" {
  cidr_block                 = var.vpc_cidr
  enable_dns_hostnames       = true
  enable_dns_support         = true 
  tags                       = map("Name", join("_",[var._environment]), join("",["kubernetes.io/cluster/",var.cluster_name]),"shared")
}

resource "aws_internet_gateway" "k8s_igw" {
  vpc_id = aws_vpc.k8s_vpc.id
  tags                      = map(
                             "Name", join("_",[var._environment,"igw"])
     )
}


//public subnet

resource "aws_subnet" "k8s_pub_subnets" {
    count                       = length(var.av_zones)
    vpc_id                      = aws_vpc.k8s_vpc.id
    cidr_block                  = element(var.k8s_pub_subnets_cidrs, count.index)
    availability_zone           = element(var.av_zones, count.index)
    map_public_ip_on_launch     = false
    tags = map(
        "Name", join("_",[var._environment,"pub_subnet",element(var.av_zones, count.index)]),
        "type", "public"
        )
   depends_on                  = ["aws_vpc.k8s_vpc"]
}


resource "aws_route_table" "dev_k8s_pub_route_table" {
    vpc_id = aws_vpc.k8s_vpc.id
    tags = map(
    "Name", join("_",[var._environment,"pub_rt"]), )    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.k8s_igw.id
    }
}

resource "aws_route_table_association" "k8s_pub_subnets_assoc" {
  count          = length(var.av_zones)
  subnet_id       = element(aws_subnet.k8s_pub_subnets.*.id, count.index)
  route_table_id = aws_route_table.dev_k8s_pub_route_table.id
}


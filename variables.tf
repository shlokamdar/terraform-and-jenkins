# variables.tf
#VPC CIDR Block Variable
variable "cidr_block" {
  description = "The CIDR block for the VPC"  
}

#Public Subnet CIDR Block Variable
variable "public_subnet_cidr" {
    description = "The CIDR block for the public subnet"
}

#Private Subnet CIDR Block Variable
variable "private_subnet_cidr" {
    description = "The CIDR block for the private subnet"
}



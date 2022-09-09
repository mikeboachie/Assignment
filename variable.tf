variable "region-name" {
    description = "name of region"
    default = "eu-west-2"
    type = string
}

variable "cidr-for-vpc" {
    description = "the cidr for VPC"
    default = "10.0.0.0/16"
    type = string
}

variable "cidr-for-pub-1" {
    description = "the cidr for Public Subnet 1"
    default = "10.0.100.0/24"
    type = string
}

variable "cidr-for-pub-2" {
    description = "the cidr for Public Subnet 2"
    default = "10.0.110.0/24"
    type = string
}

variable "cidr-for-priv-1" {
    description = "the cidr for Private Subnet 1"
    default = "10.0.120.0/24"
    type = string
}

variable "cidr-for-priv-2" {
    description = "the cidr for Private Subnet 1"
    default = "10.0.130.0/24"
    type = string
}

variable "Pub-1-AZ" {
    description = "Public Subnet 1 availability zone"
    default = "eu-west-2a"
    type = string
}

variable "Pub-2-AZ" {
    description = "Public Subnet 2 availability zone"
    default = "eu-west-2b"
    type = string
}

variable "Priv-1-AZ" {
    description = "Private Subnet 1 availability zone"
    default = "eu-west-2a"
    type = string
}

variable "Priv-2-AZ" {
    description = "Private Subnet 2 availability zone"
    default = "eu-west-2b"
    type = string
}
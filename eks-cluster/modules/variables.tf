#Child module variables with default values

variable "cidr_vpc" {
    default = "10.0.0.0/16"
}

variable "vpc_tags" {
    default = {
        Name = "cluster_vpc"
    }
}

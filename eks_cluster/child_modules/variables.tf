#Child module variables with default values

variable "cidr_vpc" {
    default = "10.0.0.0/16"
}

variable "sub_priv_cidr" {
    type = list
    default = []
}


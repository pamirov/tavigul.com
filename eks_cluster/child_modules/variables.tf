#Child module variables with default values

variable "cidr_vpc" {
    default = "10.0.0.0/16"
}

variable "pr_cidr" {
    type = list(string)
    default = ["10.0.1.0/24", "10.0.3.0/24", "10.0.5.0/24"]
}

variable "pub_cidr" {
    type = list(string)
    default = ["10.0.2.0/24", "10.0.4.0/24", "10.0.6.0/24"]
}

variable "pr_cidr_tag" {
  type = list(string)
  default = [ "private-sub-1", "private-sub-2", "private-sub-3" ]
}

variable "pub_cidr_tag" {
  type = list(string)
  default = [ "public-sub-1", "public-sub-2", "public-sub-3" ]
}


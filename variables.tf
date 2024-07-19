variable "VPC_subnet" {
    type = string
    default = "10.0.0.0/16"
}

variable "default_aws_az" {
     type = string
     default = "us-west-2a"
}

# variable "subnets_list" {
#   type = list(object({
#     subnet = string
#     type   = string
#     name   = optional(string)
#     az     = optional(string, "us-west-2a")
#   }))

#   default = [
#   { subnet = "10.0.0.0/24", type = "public" },
#   { subnet = "10.0.1.0/24", type = "public", name = "Custom Name Example Public" },
#   { subnet = "10.0.128.0/24", type = "private" },
#   { subnet = "10.0.129.0/24", type = "private", az = "us-west-2b", name = "Custom Name Example Private" }
#   ]
# }
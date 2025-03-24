variable "vpc" {
  type = object({
    name            = string
    cidr_block      = string
    enable_flow_logs = bool
  })
  
  description   = "Name and CIDR block for the VPC"
}

variable "public_subnet" {
  type  = map(object({
    cidr_block          = string
    availability_zone   = string
  }))

  description = "Map of public subnet name and its CIDR block and AZ"
}

variable "private_subnet" {
  type = map(object({
    cidr_block          = string
    availability_zone   = string
  }))

  description = "Map of private subnet name and its CIDR block and AZ"
}

variable "nat_gateway" {
  type          = map(object({
    public_subnet_name = string
  }))
  description   = "Map of NAT gateway name and the public subnet name in which to place the gateway"
}

variable "public_route_table" {
  type = map(object({
    public_subnet_name = list(string)
  }))
  description = "Map of public route table name and the public subnet names to associate"
}

variable "private_route_table" {
  type = map(object({
    nat_gateway_name    = string
    private_subnet_name = list(string)
  }))

  description = "Map of private route table name and the private subnet names to associate"
}
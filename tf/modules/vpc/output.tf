output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_ids" {
  value = { for k,v  in aws_subnet.public_subnet : k => v.id }
}

output "private_subnet_ids" {
  value = { for k,v  in aws_subnet.private_subnet : k => v.id }
}

output "public_route_table_ids" {
  value = { for k,v in aws_route_table.public: k => v.id}
}

output "private_route_table_ids" {
  value = { for k,v in aws_route_table.private: k => v.id}
}
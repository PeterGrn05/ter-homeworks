output "network_id" {
  description = "VPC network ID"
  value       = yandex_vpc_network.this.id
}

output "subnet_id" {
  description = "VPC subnet ID"
  value       = yandex_vpc_subnet.this.id
}

output "subnet" {
  description = "VPC subnet information"
  value       = yandex_vpc_subnet.this
}
output "marketing_vm_external_ip" {
  description = "External IP of marketing VM"
  value       = module.marketing_vm.external_ip_address
}

output "analytics_vm_external_ip" {
  description = "External IP of analytics VM"
  value       = module.analytics_vm.external_ip_address
}

output "marketing_vm_labels" {
  description = "Labels of marketing VM"
  value       = module.marketing_vm.labels
}

output "analytics_vm_labels" {
  description = "Labels of analytics VM"
  value       = module.analytics_vm.labels
}
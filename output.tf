output "cluster_id" {
  value       = azurerm_kubernetes_cluster.main_aks.id
  description = "The id of the cluster"
}

output "cluster_name" {
  value       = azurerm_kubernetes_cluster.main_aks.name
  description = "The name of the cluster"
}

output "cluster_api_service_authorised_ranges" {
  value       = azurerm_kubernetes_cluster.main_aks.api_server_authorized_ip_ranges
  description = "The list of authorised IPs"
}

output "cluster_fqdn" {
  value       = azurerm_kubernetes_cluster.main_aks.fqdn
  description = "The FQDN of the cluster"
}

output "kublet_identity" {
  value       = azurerm_kubernetes_cluster.main_aks.kubelet_identity[0].object_id
  description = "The first element of the identity object"
}

output "kube_admin_config" {
  value       = azurerm_kubernetes_cluster.main_aks.kube_admin_config
  sensitive   = true
  description = "The name of full kube_admin config, is a sensitive value"
}

output "kube_config" {
  value       = azurerm_kubernetes_cluster.main_aks.kube_config
  sensitive   = true
  description = "The full kube_config block, is a sensitive value"
}

output "kube_config_host" {
  value       = azurerm_kubernetes_cluster.main_aks.kube_config.0.host
  sensitive   = true
  description = "The name of the config host within kube config, needed for terraform kubernetes provider"
}

output "kube_username" {
  value       = azurerm_kubernetes_cluster.main_aks.kube_config.0.username
  sensitive   = true
  description = "The username within kube config, needed for terraform kubernetes provider"
}

output "kube_password" {
  value       = azurerm_kubernetes_cluster.main_aks.kube_config.0.password
  sensitive   = true
  description = "The user password within kube config, needed for terraform kubernetes provider"
}

output "kube_client_certificate" {
  value       = azurerm_kubernetes_cluster.main_aks.kube_config.0.client_certificate
  sensitive   = true
  description = "The client certificate within the kube config, needed for terraform kubernetes provider"
}

output "kube_client_key" {
  value       = azurerm_kubernetes_cluster.main_aks.kube_config.0.client_key
  sensitive   = true
  description = "The client secret within the kube conifg, needed for terraform kubernetes provider"
}

output "kube_cluster_ca_certificate" {
  value       = azurerm_kubernetes_cluster.main_aks.kube_config.0.cluster_ca_certificate
  description = "The client ca certificate located within the kube config, needed for terraform kubernetes provider"
}
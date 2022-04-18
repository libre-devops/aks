variable "rg_name" {
  description = "The name of the resource group, this module does not create a resource group, it is expecting the value of a resource group already exists"
  type        = string
  validation {
    condition     = length(var.rg_name) > 1 && length(var.rg_name) <= 24
    error_message = "Resource group name is not valid."
  }
}

variable "location" {
  description = "The location for this resource to be put in"
  type        = string
}

variable "tags" {
  description = "The tags assigned to the resource"
  type        = map(string)
  validation {
    condition     = var.tags != null
    error_message = "The tags field cannot be null."
  }
}

variable "aks_name" {
  description = "The name of the resource to be created"
  type        = string
  validation {
    condition     = length(var.aks_name) > 1 && length(var.aks_name) <= 24
    error_message = "The resource name is invalid."
  }
}

variable "kubernetes_version" {
  description = "The kubernetes version in floating point"
  type        = string
}

variable "dns_prefix" {
  description = "The DNS prefix to be assigned to the kubernetes cluster"
  type        = string
}

variable "sku_tier" {
  description = "The SKU tier of the kubernetes cluster, default is Free.  Difference only is if there is an SLA"
  type        = string
  default     = "Free"
}

variable "private_cluster_enabled" {
  description = "If true cluster API server will be exposed only on internal IP address and available only in cluster vnet."
  type        = bool
  default     = true
}

variable "enable_node_public_ip" {
  description = "(Optional) Should nodes in this Node Pool have a Public IP Address? Defaults to false."
  type        = bool
  default     = false
}

variable "admin_username" {
  description = "The admin username of the cluster"
  type        = string
  sensitive   = true
}

variable "ssh_public_key" {
  description = "The public key for the admin user"
  type        = string
}

variable "default_node_orchestrator_version" {
  description = "The orchestrator version of the default node"
  type        = string
}

variable "default_node_pool_name" {
  description = "The default pool name of the default node"
  type        = string
}

variable "default_node_vm_size" {
  description = "The VM size of the default node, e.g. Standard_B4ms"
  type        = string
}

variable "default_node_os_disk_size_gb" {
  description = "The size of the disk of the VM"
  type        = number
}

variable "default_node_subnet_id" {
  description = "The subnet ID for the kubernetes cluster"
  type        = string
}

variable "default_node_availability_zones" {
  description = "The default nodes availability zones, in list format"
  type        = list(string)
}

variable "default_node_count" {
  description = "The default amount of nodes to be provisioned, defaults to 1"
  type        = number
  default     = 1
}

variable "default_node_enable_auto_scaling" {
  description = "If auto scaling should be enabled for the default node, defaults to false"
  type        = bool
  default     = false
}

variable "default_node_enable_manually_scaling" {
  description = "If manually scaling should be enabled for the default node, defaults to false"
  type        = bool
  default     = true
}

variable "default_node_agents_max_count" {
  description = "The maximum count of agent that are deployed to the default node, defaults to 1"
  type        = number
  default     = "1"
}

variable "default_node_agents_min_count" {
  description = "The minimum count of agents that are deployed to the default node, defaults to 1"
  type        = number
}

variable "default_node_agents_type" {
  description = "Sets the default agent type"
  type        = string
  default     = "VirtualMachineScaleSets"
}

variable "client_id" {
  description = "The ID of the service principle, if one is to be used, defaults to empty string as it is not used"
  type        = string
  default     = ""
}

variable "client_secret" {
  description = "The client secret of the service principle, if one is to used, defaults to empty string as it is not used"
  type        = string
  default     = ""
}

variable "identity_type" {
  description = "The type of identity to be used, defaults to system-assigned"
  type        = string
  default     = "SystemAssigned"
}

variable "enable_auto_scaling" {
  description = "Whether auto scaling should be enabled, defaults to false"
  type        = bool
  default     = false
}

variable "user_assigned_identity_id" {
  description = "The ID of the user assigned managed identity"
  type        = string
}

variable "enable_ingress_application_gateway" {
  description = "Whether or not a application gateway should be enabled for ingress controller, defaults to null"
  default     = null
}

variable "enable_http_application_routing" {
  description = "Whether or not http routing is allowed, defaults to false"
  type        = bool
  default     = false
}

variable "enable_azure_policy" {
  description = "Whether or not an Azure policy needs to be assigned, defaults to false"
  type        = bool
  default     = false
}

variable "network_plugin" {
  description = "Network plugin to use for networking."
  type        = string
  default     = "kubenet"
}

variable "network_policy" {
  description = " (Optional) Sets up network policy to be used with Azure CNI. Network policy allows us to control the traffic flow between pods. Currently supported values are calico and azure. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "net_profile_dns_service_ip" {
  description = "(Optional) IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "net_profile_docker_bridge_cidr" {
  description = "(Optional) IP address (in CIDR notation) used as the Docker bridge IP address on nodes. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "identity_ids" {
  description = "Specifies a list of user managed identity ids to be assigned to the VM."
  type        = list(string)
  default     = []
}

variable "net_profile_outbound_type" {
  description = "(Optional) The outbound (egress) routing method which should be used for this Kubernetes Cluster. Possible values are loadBalancer and userDefinedRouting. Defaults to loadBalancer."
  type        = string
  default     = "loadBalancer"
}

variable "net_profile_pod_cidr" {
  description = " (Optional) The CIDR to use for pod IP addresses. This field can only be set when network_plugin is set to kubenet. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "net_profile_service_cidr" {
  description = "(Optional) The Network Range used by the Kubernetes service. Changing this forces a new resource to be created."
  type        = string
  default     = null
}
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.main_aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | The admin username of the cluster | `string` | n/a | yes |
| <a name="input_aks_name"></a> [aks\_name](#input\_aks\_name) | The name of the resource to be created | `string` | n/a | yes |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | The ID of the service principle, if one is to be used, defaults to empty string as it is not used | `string` | `""` | no |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | The client secret of the service principle, if one is to used, defaults to empty string as it is not used | `string` | `""` | no |
| <a name="input_default_node_agents_max_count"></a> [default\_node\_agents\_max\_count](#input\_default\_node\_agents\_max\_count) | The maximum count of agent that are deployed to the default node, defaults to 1 | `number` | `"1"` | no |
| <a name="input_default_node_agents_min_count"></a> [default\_node\_agents\_min\_count](#input\_default\_node\_agents\_min\_count) | The minimum count of agents that are deployed to the default node, defaults to 1 | `number` | n/a | yes |
| <a name="input_default_node_agents_type"></a> [default\_node\_agents\_type](#input\_default\_node\_agents\_type) | Sets the default agent type | `string` | `"VirtualMachineScaleSets"` | no |
| <a name="input_default_node_availability_zones"></a> [default\_node\_availability\_zones](#input\_default\_node\_availability\_zones) | The default nodes availability zones, in list format | `list(string)` | n/a | yes |
| <a name="input_default_node_count"></a> [default\_node\_count](#input\_default\_node\_count) | The default amount of nodes to be provisioned, defaults to 1 | `number` | `1` | no |
| <a name="input_default_node_enable_auto_scaling"></a> [default\_node\_enable\_auto\_scaling](#input\_default\_node\_enable\_auto\_scaling) | If auto scaling should be enabled for the default node, defaults to false | `bool` | `false` | no |
| <a name="input_default_node_enable_manually_scaling"></a> [default\_node\_enable\_manually\_scaling](#input\_default\_node\_enable\_manually\_scaling) | If manually scaling should be enabled for the default node, defaults to false | `bool` | `true` | no |
| <a name="input_default_node_orchestrator_version"></a> [default\_node\_orchestrator\_version](#input\_default\_node\_orchestrator\_version) | The orchestrator version of the default node | `string` | n/a | yes |
| <a name="input_default_node_os_disk_size_gb"></a> [default\_node\_os\_disk\_size\_gb](#input\_default\_node\_os\_disk\_size\_gb) | The size of the disk of the VM | `number` | n/a | yes |
| <a name="input_default_node_pool_name"></a> [default\_node\_pool\_name](#input\_default\_node\_pool\_name) | The default pool name of the default node | `string` | n/a | yes |
| <a name="input_default_node_subnet_id"></a> [default\_node\_subnet\_id](#input\_default\_node\_subnet\_id) | The subnet ID for the kubernetes cluster | `string` | n/a | yes |
| <a name="input_default_node_vm_size"></a> [default\_node\_vm\_size](#input\_default\_node\_vm\_size) | The VM size of the default node, e.g. Standard\_B4ms | `string` | n/a | yes |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | The DNS prefix to be assigned to the kubernetes cluster | `string` | n/a | yes |
| <a name="input_enable_auto_scaling"></a> [enable\_auto\_scaling](#input\_enable\_auto\_scaling) | Whether auto scaling should be enabled, defaults to false | `bool` | `false` | no |
| <a name="input_enable_azure_policy"></a> [enable\_azure\_policy](#input\_enable\_azure\_policy) | Whether or not an Azure policy needs to be assigned, defaults to false | `bool` | `false` | no |
| <a name="input_enable_http_application_routing"></a> [enable\_http\_application\_routing](#input\_enable\_http\_application\_routing) | Whether or not http routing is allowed, defaults to false | `bool` | `false` | no |
| <a name="input_enable_ingress_application_gateway"></a> [enable\_ingress\_application\_gateway](#input\_enable\_ingress\_application\_gateway) | Whether or not a application gateway should be enabled for ingress controller, defaults to null | `any` | `null` | no |
| <a name="input_enable_node_public_ip"></a> [enable\_node\_public\_ip](#input\_enable\_node\_public\_ip) | (Optional) Should nodes in this Node Pool have a Public IP Address? Defaults to false. | `bool` | `false` | no |
| <a name="input_enable_rbac"></a> [enable\_rbac](#input\_enable\_rbac) | Whether or not RBAC is enabled on the cluster | `bool` | n/a | yes |
| <a name="input_identity_ids"></a> [identity\_ids](#input\_identity\_ids) | Specifies a list of user managed identity ids to be assigned to the VM. | `list(string)` | `[]` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | The type of identity to be used, defaults to system-assigned | `string` | `"SystemAssigned"` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | The kubernetes version in floating point | `string` | n/a | yes |
| <a name="input_law_workspace_id"></a> [law\_workspace\_id](#input\_law\_workspace\_id) | Specifics if a OMS agent should be enabled on the cluster, set as empty string to disable by default | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | The location for this resource to be put in | `string` | n/a | yes |
| <a name="input_net_profile_dns_service_ip"></a> [net\_profile\_dns\_service\_ip](#input\_net\_profile\_dns\_service\_ip) | (Optional) IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_net_profile_docker_bridge_cidr"></a> [net\_profile\_docker\_bridge\_cidr](#input\_net\_profile\_docker\_bridge\_cidr) | (Optional) IP address (in CIDR notation) used as the Docker bridge IP address on nodes. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_net_profile_outbound_type"></a> [net\_profile\_outbound\_type](#input\_net\_profile\_outbound\_type) | (Optional) The outbound (egress) routing method which should be used for this Kubernetes Cluster. Possible values are loadBalancer and userDefinedRouting. Defaults to loadBalancer. | `string` | `"loadBalancer"` | no |
| <a name="input_net_profile_pod_cidr"></a> [net\_profile\_pod\_cidr](#input\_net\_profile\_pod\_cidr) | (Optional) The CIDR to use for pod IP addresses. This field can only be set when network\_plugin is set to kubenet. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_net_profile_service_cidr"></a> [net\_profile\_service\_cidr](#input\_net\_profile\_service\_cidr) | (Optional) The Network Range used by the Kubernetes service. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | Network plugin to use for networking. | `string` | `"kubenet"` | no |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | (Optional) Sets up network policy to be used with Azure CNI. Network policy allows us to control the traffic flow between pods. Currently supported values are calico and azure. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | If true cluster API server will be exposed only on internal IP address and available only in cluster vnet. | `bool` | `true` | no |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | The name of the resource group, this module does not create a resource group, it is expecting the value of a resource group already exists | `string` | n/a | yes |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | The SKU tier of the kubernetes cluster, default is Free.  Difference only is if there is an SLA | `string` | `"Free"` | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | The public key for the admin user | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags assigned to the resource | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_api_service_authorised_ranges"></a> [cluster\_api\_service\_authorised\_ranges](#output\_cluster\_api\_service\_authorised\_ranges) | The list of authorised IPs |
| <a name="output_cluster_fqdn"></a> [cluster\_fqdn](#output\_cluster\_fqdn) | The FQDN of the cluster |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | The id of the cluster |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | The name of the cluster |
| <a name="output_kube_admin_config"></a> [kube\_admin\_config](#output\_kube\_admin\_config) | The name of full kube\_admin config, is a sensitive value |
| <a name="output_kube_client_certificate"></a> [kube\_client\_certificate](#output\_kube\_client\_certificate) | The client certificate within the kube config, needed for terraform kubernetes provider |
| <a name="output_kube_client_key"></a> [kube\_client\_key](#output\_kube\_client\_key) | The client secret within the kube conifg, needed for terraform kubernetes provider |
| <a name="output_kube_cluster_ca_certificate"></a> [kube\_cluster\_ca\_certificate](#output\_kube\_cluster\_ca\_certificate) | The client ca certificate located within the kube config, needed for terraform kubernetes provider |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | The full kube\_config block, is a sensitive value |
| <a name="output_kube_config_host"></a> [kube\_config\_host](#output\_kube\_config\_host) | The name of the config host within kube config, needed for terraform kubernetes provider |
| <a name="output_kube_password"></a> [kube\_password](#output\_kube\_password) | The user password within kube config, needed for terraform kubernetes provider |
| <a name="output_kube_username"></a> [kube\_username](#output\_kube\_username) | The username within kube config, needed for terraform kubernetes provider |
| <a name="output_kublet_identity"></a> [kublet\_identity](#output\_kublet\_identity) | The first element of the identity object |

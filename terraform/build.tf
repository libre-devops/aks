module "rg" {
  source = "registry.terraform.io/libre-devops/rg/azurerm"

  rg_name  = "rg-${var.short}-${var.loc}-${terraform.workspace}-build" // rg-ldo-euw-dev-build
  location = local.location                                            // compares var.loc with the var.regions var to match a long-hand name, in this case, "euw", so "westeurope"
  tags     = local.tags

  #  lock_level = "CanNotDelete" // Do not set this value to skip lock
}

module "network" {
  source = "registry.terraform.io/libre-devops/network/azurerm"

  rg_name  = module.rg.rg_name // rg-ldo-euw-dev-build
  location = module.rg.rg_location
  tags     = local.tags

  vnet_name     = "vnet-${var.short}-${var.loc}-${terraform.workspace}-01" // vnet-ldo-euw-dev-01
  vnet_location = module.network.vnet_location

  address_space   = ["10.0.0.0/16"]
  subnet_prefixes = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnet_names    = ["sn1-${module.network.vnet_name}", "sn2-${module.network.vnet_name}", "sn3-${module.network.vnet_name}"] //sn1-vnet-ldo-euw-dev-01
  subnet_service_endpoints = {
    "sn1-${module.network.vnet_name}" = ["Microsoft.Storage"]                   // Adds extra subnet endpoints to sn1-vnet-ldo-euw-dev-01
    "sn2-${module.network.vnet_name}" = ["Microsoft.Storage", "Microsoft.Sql"], // Adds extra subnet endpoints to sn2-vnet-ldo-euw-dev-01
    "sn3-${module.network.vnet_name}" = ["Microsoft.AzureActiveDirectory"]      // Adds extra subnet endpoints to sn3-vnet-ldo-euw-dev-01
  }
}

module "aks" {
  source = "registry.terraform.io/libre-devops/aks/azurerm"

  rg_name  = module.rg.rg_name
  location = module.rg.rg_location
  tags     = module.rg.rg_tags

  aks_name                = "aks-${var.short}-${var.loc}-${terraform.workspace}-01"
  admin_username          = "LibreDevOpsAdmin"
  ssh_public_key          = data.azurerm_ssh_public_key.mgmt_ssh_key.public_key
  kubernetes_version      = "1.22"
  dns_prefix              = "ldo"
  sku_tier                = "Free"
  private_cluster_enabled = true

  default_node_enable_auto_scaling  = false
  default_node_orchestrator_version = "1.22"
  default_node_pool_name            = "lbdo-pool"
  default_node_vm_size              = "Standard_B2ms"
  default_node_os_disk_size_gb      = "127"
  default_node_subnet_id            = element(module.network.subnets_ids, 2)
  default_node_availability_zones   = ["1"]
  default_node_count                = "1"
  default_node_agents_min_count     = null
  default_node_agents_max_count     = null
  enable_rbac                       = true
  identity_type                     = "SystemAssigned"
}

# data "azurerm_key_vault" "PuneetVault" {
#   name                = "PuneetVault"
#   resource_group_name = "Puneet-rg"
# }

data "azurerm_key_vault" "kvaish" {
  for_each            = var.vm_aish
  name                = each.value.kv_name
  resource_group_name = each.value.resource_group_name
}


# data "azurerm_key_vault_secret" "username" {
#   for_each     = var.vm_aish
#   name         = "${each.value.vm_name}-username"
#   key_vault_id = data.azurerm_key_vault.kvaish[each.key].id
# }


# data "azurerm_key_vault_secret" "password" {
#   for_each     = var.vm_aish
#   name         = "${each.value.vm_name}-password"
#   key_vault_id = data.azurerm_key_vault.kvaish[each.key].id
# }


data "azurerm_network_interface" "nicdataaish" {
  for_each            = var.vm_aish
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

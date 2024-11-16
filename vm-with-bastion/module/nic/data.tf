
data "azurerm_subnet" "subnetdataaish" {

  for_each             = var.nic_aish
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name

}

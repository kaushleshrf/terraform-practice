resource "azurerm_network_interface" "nic-aish" {
  for_each            = var.nic_aish
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnetdataaish[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_public_ip" "pip_aish" {
  for_each            = var.bstn_aish
  name                = each.value.pip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}


resource "azurerm_bastion_host" "bastoin_aish" {
  for_each            = var.bstn_aish
  name                = each.value.bastion_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.subnetdataaish[each.key].id
    public_ip_address_id = resource.azurerm_public_ip.pip_aish[each.key].id
  }
}

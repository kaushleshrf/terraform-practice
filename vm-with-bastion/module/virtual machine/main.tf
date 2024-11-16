

resource "azurerm_key_vault_secret" "username" {
  for_each     = var.vm_aish
  name         = "${each.value.vm_name}-username"
  value        = "${each.value.vm_name}-aish"
  key_vault_id = data.azurerm_key_vault.kvaish[each.key].id
}

resource "random_password" "apass" {
  for_each         = var.vm_aish
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "azurerm_key_vault_secret" "password" {
  for_each     = var.vm_aish
  name         = "${each.value.vm_name}-password"
  value        = random_password.apass[each.key].result
  key_vault_id = data.azurerm_key_vault.kvaish[each.key].id
}



resource "azurerm_linux_virtual_machine" "vm_aish" {
  for_each            = var.vm_aish
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size

  admin_username                  = azurerm_key_vault_secret.username[each.key].value
  admin_password                  = azurerm_key_vault_secret.password[each.key].value
  disable_password_authentication = false

  network_interface_ids = [data.azurerm_network_interface.nicdataaish[each.key].id]



  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}



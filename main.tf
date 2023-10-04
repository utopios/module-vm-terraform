resource "azurerm_virtual_machine" "example" {
  name                  = var.machine_name
  location              = var.location
  resource_group_name   = var.group_name
  network_interface_ids = var.nics
  vm_size               = var.size
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "example-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "adminuser"
    admin_password = "P@ssword1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      path = "/home/adminuser/.ssh/authorized_keys"
      #key_data = tls_private_key.example.public_key_openssh
      key_data = var.public_key
    }
  }
}
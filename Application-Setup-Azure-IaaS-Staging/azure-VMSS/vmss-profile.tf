# Default Profile
resource "azurerm_monitor_autoscale_setting" "az_vmss_autoscale" {
  name                = "${var.env-1}-vmss-autoscale-def-profiles"
  resource_group_name = var.vmss_resource_group_name
  location            = var.vmss_resource_group_location
  target_resource_id  = azurerm_linux_virtual_machine_scale_set.linux_web_vmss.id

#   # Notification block
#   notification {
#     email {
#       #send_to_subscription_administrator = true
#       custom_emails = ["use email ID here"]
#     }
#   }

  # Profile block
  profile {
    name = "deafultProfile"
    capacity {
      default = 1
      minimum = 1
      maximum = 2
    }

    rule {
      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = 1
        cooldown  = "PT5M"
      }

      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.linux_web_vmss.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 75
        metric_namespace   = "microsoft.compute/virtualmachinescalesets"
        dimensions {
          name     = "AppName"
          operator = "Equals"
          values   = ["App1"]
        }
      }
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.linux_web_vmss.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 25
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }
  }
}

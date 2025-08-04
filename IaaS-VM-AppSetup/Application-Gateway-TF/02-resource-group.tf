# resource "azurerm_resource_group" "appgw_tf_rg" {
#   name = data.terraform_remote_state.calling_hub_resources.outputs.out_az_rg_name
#   location = data.terraform_remote_state.calling_hub_resources.outputs.out_az_rg_location
# }

data "azurerm_resource_group" "appgw_tf_rg" {
  name = data.terraform_remote_state.calling_hub_lb_resources.outputs.out_az_rg_name
  # location = data.terraform_remote_state.calling_hub_lb_resources.outputs.out_az_rg_location
}
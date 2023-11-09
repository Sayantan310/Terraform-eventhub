locals {
  resource_group_name = "1234-dev"
  azurerm_storage_account = "sayantan1234"
  azurerm_eventhub_namespace = "Sayantan"
  eventhub_name = "ehub"
  stream_analytics_job_name = "Stream2"
  default_primary_key = "Cqr8B9EvcJjCMDHBkWMMLIoWddElnc729+AEhCqB3pQ="
}

resource "azurerm_stream_analytics_output_eventhub" "output" {
  name                      = "o-eventhub"
  stream_analytics_job_name = local.stream_analytics_job_name
  resource_group_name       = local.resource_group_name
  eventhub_name             = local.eventhub_name
  servicebus_namespace      = local.azurerm_eventhub_namespace
  shared_access_policy_key  = local.default_primary_key
  shared_access_policy_name = "RootManageSharedAccessKey"

  serialization {
    type = "Json"
    encoding = "UTF8"
    format = "Array"
  }
}
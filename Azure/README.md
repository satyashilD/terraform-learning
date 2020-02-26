When it comes for Azure then like aws it also have got multiple authentication options and based on our work and priorities we can opt for any one of it.
here on this link you will get more details on Authenticating to Azure https://www.terraform.io/docs/providers/azurerm/index.html 

provider block for Azure looks like this:
```
provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.38.0"
  subscription_id = "XXXXXXXXXXXXXXX"
  client_id = "XXXXXXXXXXXXX"
  client_secret = "XXXXXXXXX"
  tenant_id = "XXXXXXXXXX"
}
```
when i started working on Azure with terraform the version was 1.38.0 which is now 2.0 so you know how rapid the terraforom developemnt is happening

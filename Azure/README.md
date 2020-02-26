When it comes for Azure then like aws it also have got multiple authentication options and based on our work and priorities we can opt for any one of it.
here on this [link](https://www.terraform.io/docs/providers/azurerm/index.html ) you will get more details on Authenticating to Azure 

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
when i started working on Azure with terraform the version was 1.38.0 which is now 2.0 so you know how rapid the terraforom developemnt is happening. I chose to go with authenticating with service principle & secret that way i dont have to worry about session timeouts like issues. Now the question is how to generate these details here's some steps to get started with it

- Goto Azure Active Directory
- App registration
- New Registration
- Give it a name & Choose your tennat accessiblility based on your organization it can be single or multiple it's up to you
- Register
Once the App registration is done you will be redirected to it's Dashboard where we will get ``` client_id & tenant_id ``` now lastly we need to generate the secret and for this let's follow below steps
- Click on Certificates & secrtes `(on from the same page left side control pane)`
- New Client secret
- Pic the expiry time for this secret
- Copy the Value `( it will be a one time thing once you close the tab you can not get the value again and you will have to re-generate it)`

Thats it for authorization of azure with terraform and now we have all the required details and subscription id you can copy from subscriptions dashboard


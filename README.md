# Important Commands

This command pulls any provider code that is required by terraform.

```bash
terraform init
```

This runs a Sanity check and shows us the changes that will be applied to the resources over the console.

```bash
terraform plan   
```

This is the command to provison our Infrastructure according to the current state of the terraform `.tf` file.

```bash
terraform apply  
terraform apply --auto-approve  # Ignores the prompt
```

This is the command to destroy our Infrastructure completely based on our terraform file. Often its a bad idea to run this in production environment.

```bash
terraform destroy
```

This command is used to list down the current terraform state.
```
terraform state list
terraform state show <aws_eip.one> 
```

This command is used to reads an output variable from a Terraform state file and prints the value.
```
terraform output
trrraform refresh
```

# Structure

The structure of a terraform file is as follows.

1. We have a provider at the start of the terraform file.
```
provider "aws" {
  region = "ap-south-1"
  # bad practice to hardcode access keys here
  # access_key = "AKIA....."
  # secret_key = "bK.........DA"
  
  # better approach to use exported variables with the creds
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY

  # or aws profile specified as
  profile = "..."
}
```


2. Following the definition we have resource definition as follows:

```
resource "<provider>_<resource>" "name" {
   [config options ...]
   key="value"
   key2="value2"
}
```

# Important Terraform Files

1. `.terraform` - Folder gets initialized when we install any pugins.

2. `terraform.tfstate` - This file represents the state of terraform. Never mess around with this file.

# Reference:

1. [https://registry.terraform.io/browse/providers](https://registry.terraform.io/browse/providers)
2. [https://registry.terraform.io/providers/hashicorp/aws/latest/docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

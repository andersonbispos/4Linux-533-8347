write .tf -> terraform plan -> terraform apply ~> terraform destroy

write .tf -> terraform init ~> terraform fmt ~> terraform validate ~> terraform plan -> terraform apply ~> terraform destroy

         | us-east-2a               | us-east-2b                | us-east-2c 
publica  | sub-public-us-east-2a    | sub-publica-us-east-2b    | sub-pulica-us-east-2c
privada  | sub-priv-us-east-2a      | sub-priv-us-east-2b       | sub-priv-us-east-2c
b-dados  | sub-data-us-east-2a      | sub-data-us-east-2b       | sub-data-us-east-2c
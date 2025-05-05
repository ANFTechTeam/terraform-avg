# Project README

## Overview

This repository contains Terraform code examples designed to provision and manage Azure NetApp Files application volume groups. Azure NetApp Files is a high-performance file storage service that supports various workloads, and application volume groups simplify the deployment of related volumes for SAP HANA and Oracle.

## Features

- **Automated Volume Group Management**: Simplifies the creation, modification, and deletion of Azure NetApp Files application volume groups.
- **Version Control**: Tracks changes to volume group configurations.
- **Scalability**: Supports scaling storage capacity and performance based on application needs.
- **Integration**: Seamlessly integrates with Azure services and workloads.

## Prerequisites

- Install [Terraform](https://www.terraform.io/downloads.html).
- Configure access credentials for your Azure account.
- Ensure the Azure NetApp Files service is enabled in your subscription.

## Examples included in this repo

- [oracle-destination-avg](/oracle-destination-avg) - This example creates destination volumes (cross-zone or cross-region replication) for an existing application volume group for Oracle. 

## Usage

1. Clone this repository:
    ```bash
    git clone https://github.com/ANFTechTeam/terraform-avg.git
    cd your-repo-name
    ```

2. Initialize Terraform:
    ```bash
    terraform init
    ```

3. Review and customize the variables in the `variables.tf` and `terraform.tfvars` files, including details for the NetApp account, capacity pool, and volume configurations.

4. Plan the infrastructure changes:
    ```bash
    terraform plan
    ```

5. Apply the changes to provision the Application Volume Group:
    ```bash
    terraform apply
    ```

6. To destroy the Application Volume Group:
    ```bash
    terraform destroy
    ```

## Notes

- Follow best practices for managing sensitive data, such as using Azure Key Vault or environment variables for credentials.
- Regularly review and update the Terraform code to align with evolving application and storage requirements.

## Resources

- [Azure NetApp Files Documentation](https://learn.microsoft.com/en-us/azure/azure-netapp-files/)
- [Terraform Azure Provider Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [HashiCorp Learn](https://learn.hashicorp.com/terraform)

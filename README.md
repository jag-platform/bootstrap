# bootstrap

Creates the S3 bucket that stores the **Terraform remote state** for every other repo in the `jag-platform` organization.

## Why a separate repo?

Remote state needs a bucket, but the bucket has to be created by Terraform too: chicken and egg.
This repo is applied **once, manually, with local state**. After that its own state is migrated
into the bucket it created, and every other repo uses that bucket as its backend.

## State layout

One bucket for the whole organization, one key per product / environment / component:

```
<product>/<environment>/<component>/terraform.tfstate
```

For example `platform/shared/bootstrap/terraform.tfstate` or `shop/dev/network/terraform.tfstate`.

## Usage

```bash
aws sso login --sso-session jag
terraform init
terraform plan
terraform apply
```

Requirements: Terraform version pinned in `.terraform-version` (via [tenv](https://github.com/tofuutils/tenv)) and an AWS profile called `jag-shared`.

> This bucket holds the state of everything else. **It is never destroyed.**

# terraform-check-modules-workflow

A callable GitHub Actions workflow for checking Terraform modules for validity and style. It will find all Terraform modules in a repository and perform standard static checks on them.

## Checks

* [`terraform fmt`](https://www.terraform.io/cli/commands/fmt): formatting and whitespace
* [`terraform validate`](https://www.terraform.io/cli/commands/validate): syntax and resource schemas
* [`tflint`](https://github.com/terraform-linters/tflint): additional [lint rules](https://github.com/takescoop/tflint-config)

## Usage

```yml
name: Check Terraform Modules
jobs:
  check:
    uses: takescoop/check-terraform-modules-workflow/.github/workflows/check.yml
    with:
      terraform_token: ${{ secrets.MY_TF_TOKEN }}
```

## Contributing

The workflow is automatically tested against a valid module on each pull request. This workflow implements conventions specific to the [`@takescoop`](@takescoop) organization. While GitHub allows public callable workflows to be used in any organization, customizations for external users will not be accepted.

### Releasing

Create a new semver tag based on the included changes. In addition to the workflow's interface (inputs, outputs), version increments should also consider the behavior of the checks the workflow implements. For example, enabling a new lint rule is a major revision if it rejects code that was previously valid. It is a minor revision if the rejected code was previously invalid.

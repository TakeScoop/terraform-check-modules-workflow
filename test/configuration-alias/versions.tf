terraform {
  required_version = ">= 1, < 2"

  required_providers {
    null = {
      source  = "hashicorp/null"
      version = ">= 1"

      configuration_aliases = [ null.foo ]
    }
  }
}

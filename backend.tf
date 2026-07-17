terraform {
  backend "s3" {
    bucket       = "2tier-app-state-bucket"
    key          = "2tier-app/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}
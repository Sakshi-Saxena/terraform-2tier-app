run "vpc_test" {

  assert {
    condition = length(module.vpc.public_subnets) > 0
    error_message = "Public subnet not created"
  }
}
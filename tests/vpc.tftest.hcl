variables {
  aws_region = "us-east-1"
  project_name = "test-app"
  vpc_cidr = "10.0.0.0/16"

  public_subnets = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  private_subnets = [
    "10.0.3.0/24",
    "10.0.4.0/24"
  ]

  instance_type = "t3.micro"
  desired_capacity = 1
  min_size = 1
  max_size = 2
  my_ip = "0.0.0.0/0"
}

run "vpc_test" {
  command = plan

  assert {
    condition     = length(module.vpc.public_subnets) > 0
    error_message = "Public subnet was not created."
  }
}
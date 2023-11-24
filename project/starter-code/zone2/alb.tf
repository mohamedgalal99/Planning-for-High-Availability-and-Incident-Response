module "project_alb" {
  source = "./modules/alb"
  ec2 = module.project_ec2.aws_instance
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_id = data.terraform_remote_state.vpc.outputs.public_subnet_ids
  ec2_sg = module.project_ec2.ec2_sg
}


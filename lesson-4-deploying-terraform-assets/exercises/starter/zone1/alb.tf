module "project_alb" {
  source = "./modules/alb"
  ec2 = module.project_ec2.aws_instance
  vpc_id = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnet_ids
  ec2_sg = module.project_ec2.ec2_sg
}
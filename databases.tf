resource "aws_db_instance" "rds" {
  allocated_storage    = 10
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  name                 = var.name
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  availability_zone = "${var.region}a"
  skip_final_snapshot  = true
}

resource "aws_elasticache_subnet_group" "elasticache_subnet_group" {

  name       = "cache-subnets"
  subnet_ids = ["${module.network.privatesubnet1}", "${module.network.privatesubnet2}"]
}



resource "aws_elasticache_cluster" "elasticache_cluster" {
  cluster_id           = "cluster-example"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  engine_version       = "3.2.10"
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.elasticache_subnet_group.name  
}
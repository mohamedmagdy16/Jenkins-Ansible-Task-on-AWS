region            = "us-east-1"
ami               = "ami-052efd3df9dad4825"
vpc               = "10.0.0.0/16"
publicsubnet1     = "10.0.1.0/24"
publicsubnet2     = "10.0.2.0/24"
privatesubnet1    = "10.0.3.0/24"
privatesubnet2    = "10.0.4.0/24"
ec2_instance_type = "t2.micro"


# database configuration
engine               = "mysql"
engine_version       = "5.7"
instance_class       = "db.t2.micro"
name                 = "mydb"
username             = "user1"
password             = "Password12"
parameter_group_name = "default.mysql5.7"
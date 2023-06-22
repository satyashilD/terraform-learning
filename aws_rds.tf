resource "aws_db_instance" "testrds" {
  
  identifier        = "terraformdb"
  engine            = "mysql"
  engine_version    = "5.6.39"
  instance_class    = "db.t2.micro"
  allocated_storage = 20
  storage_type      = "gp2"
  storage_encrypted = "false"
  license_model     = "general-public-license"

  name                                = "terraformdb"
  username                            = "useradmin"
  password                            = "XXXXXX"
  port                                = 3306
  
  vpc_security_group_ids = ["sg-08b94a572ae5e8cc1"]
 # db_subnet_group_name   = "default"
  parameter_group_name   = "default.mysql5.6"
  

  availability_zone   = "us-east-2a"
  multi_az            = "false"
  publicly_accessible = 0

  allow_major_version_upgrade = 1
  auto_minor_version_upgrade  = 0
  apply_immediately           = "false"
  maintenance_window          = "Mon:00:00-Mon:03:00"
  
  backup_retention_period = 7
  backup_window           = "09:46-10:16"
  }


################################################################################################
### Deploy Postgres DB
################################################################################################

resource "aws_security_group" "db_sec_group" {
  name = "db_sec_group"
  description = "Security Group for the DB"

  vpc_id = data.terraform_remote_state.network.outputs.db-vpc-id  
  # tags = {
  #   name = "name"
  # }
  // Allow ALL outbound traffic
  egress {
    from_port = 0
    protocol = "-1" // ALL Protocols
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  // Allow Inbound traffic from app on 5432
  ingress {
    from_port = 5432
    protocol = "tcp"
    to_port = 5432
    cidr_blocks = ["10.2.0.0/16"]
  }  

  tags = {
    Name = var.db_name
    email = var.email
  }
}


resource "aws_db_parameter_group" "rds_postgres_pg" {
  name        = var.parameter_group_name
  family      = var.parameter_group_family
  description = "RBS RDS parameter group"
  parameter {
    name  = "log_statement"
    value = var.param_log_statement
  }
  parameter {
    name  = "log_min_duration_statement"
    value = var.param_log_min_duration_statement
  }

  parameter {
    name  = "idle_in_transaction_session_timeout"
    value = 0
  }
  tags = {
    Name = var.db_name
    email = var.email
  }
}

resource "aws_db_subnet_group" "rds_postgres_subnet_group" {
  name       = var.subnet_group_name
  subnet_ids = [
    "${data.terraform_remote_state.network.outputs.db-subnet1a-id}",
    "${data.terraform_remote_state.network.outputs.web-db-subnet1b-id}"
  ]

  tags = {
    Name = var.db_name
    email = var.email
  }
}

resource "aws_db_instance" "rds_postgres" {
  # 'name' is deprecated in favor of 'db_name' after provider version 4.0.0
  db_name = var.postgres_name

  identifier_prefix     = var.identifier_prefix
  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  storage_type          = var.storage_type
  storage_encrypted     = true

  engine                     = "postgres"
  engine_version             = var.engine_version
  instance_class             = var.instance_class
  auto_minor_version_upgrade = var.auto_minor_version_upgrade

  username = "rbsuser"
  password = "rbspassword"
  port     = var.db_port

  db_subnet_group_name   = aws_db_subnet_group.rds_postgres_subnet_group.name
  multi_az               = var.multi_az
  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.db_sec_group.id]
  parameter_group_name   = aws_db_parameter_group.rds_postgres_pg.name

  maintenance_window      = var.maintenance_window
  backup_window           = var.backup_window
  backup_retention_period = var.backup_retention_period
  skip_final_snapshot     = var.skip_final_snapshot

  apply_immediately = var.apply_immediately

  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports ? ["postgresql", "upgrade"] : []

  copy_tags_to_snapshot = var.copy_tags_to_snapshot

  tags = {
    Name = var.db_name
    email = var.email
  }

  # # Performance Insights
  # performance_insights_enabled          = false
  # performance_insights_retention_period = var.performance_insights_enabled ? var.performance_insights_retention_period : null

  lifecycle {
    ignore_changes = [password]
  }
}
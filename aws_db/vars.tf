
###########################################################

# variable "password" {
#   description = "The password for the master DB user."
#   type        = string
# }

variable "db_name" {}
variable "email" {}
variable "region" {}

variable "username" {
  description = "The username for the master DB user."
  type        = string
  default     = "rbsuser"
}

variable "db_port" {
  description = "The port on which the database accepts connections."
  type        = number
  default     = 5432
}

variable "postgres_name" {
  description = "The name of the postgres database to create on the DB instance"
  type        = string
  default     = "rbs_rds_db"
}

variable "parameter_group_name" {
  description = "The name of the rds parameter group"
  type        = string
  default     = "rds-postgres-pg"
}

variable "param_log_min_duration_statement" {
  description = "(ms) Sets the minimum execution time above which statements will be logged."
  type        = string
  default     = "-1"
}

variable "param_log_statement" {
  description = "Sets the type of statements logged. Valid values are none, ddl, mod, all"
  type        = string
  default     = "none"
}

variable "identifier_prefix" {
  description = "Identifier prefix for the RDS instance"
  type        = string
  default     = "rbs-rds-"
}

variable "allocated_storage" {
  description = "Allocate storage"
  type        = number
  default     = 20
}

variable "max_allocated_storage" {
  description = "Max allocate storage"
  type        = number
  default     = 50
}

variable "storage_type" {
  description = "Storage type (e.g. gp2, io1)"
  type        = string
  default     = "gp2"
}

variable "instance_class" {
  description = "Instance class"
  type        = string
  default     = "db.m5.large"
}

variable "maintenance_window" {
  description = "Maintenance window"
  type        = string
  default     = "sun:04:32-sun:05:02"
}

variable "backup_window" {
  description = "Backup window"
  type        = string
  default     = "03:29-03:59"
}

variable "backup_retention_period" {
  description = "Backup retention period in days"
  type        = number
  default     = 14
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot"
  type        = bool
  default     = true
}

variable "apply_immediately" {
  description = "Apply immediately, do not set this to true for production"
  type        = bool
  default     = false
}

variable "subnet_group_name" {
  description = "The name of the subnet group to add the RDS instance to"
  type        = string
  default = "rbs-subnet-group"
}

# variable "rds_subnet_ids" {
#   description = "VPC subnet IDs in subnet group"
#   type        = list(string)
# }

variable "copy_tags_to_snapshot" {
  description = "Copy tags to snapshots"
  type        = bool
  default     = true
}

# variable "additional_tags" {
#   type        = map(string)
#   description = "[DEPRECATED: Use `tags` instead] Additional tags to set on the RDS instance."
#   default     = {}
# }

# variable "tags" {
#   type        = map(string)
#   description = "A map of tags to add to all resources. Replaces `additional_tags`."
#   default     = {}
# }

# variable "security_group_ids" {
#   description = "List of security group IDs to associate"
#   type        = list(string)
# }

variable "engine_version" {
  description = "Version of RDS Postgres"
  type        = string
  default     = "14"
}

variable "parameter_group_family" {
  description = "The family of the DB parameter group"
  type        = string
  default     = "postgres14"
}

variable "auto_minor_version_upgrade" {
  default     = true
  type        = bool
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window"
}

variable "enabled_cloudwatch_logs_exports" {
  default     = true
  type        = bool
  description = "Indicates that postgresql logs will be configured to be sent automatically to Cloudwatch"
}

variable "multi_az" {
  default     = true
  type        = bool
  description = "Specifies if the RDS instance is multi-AZ."
}

variable "performance_insights_enabled" {
  default     = false
  type        = bool
  description = "Specifies whether Performance Insights are enabled."
}

variable "performance_insights_retention_period" {
  default     = 7
  type        = number
  description = "The amount of time in days to retain Performance Insights data. Either 7 (7 days) or 731 (2 years)."
}
resource "aws_db_instance" "mi_aguila_postgresql_db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "11.4"
  instance_class       = "db.t2.micro"
  name                 = "miaguiladb"
  username             = "miaguilauser"
  password             = "miaguilapassword"
}

resource "aws_db_instance" "mi_aguila_dataware_house" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "11.4"
  instance_class       = "db.t2.micro"
  name                 = "miaguiladb"
  username             = "miaguilauser"
  password             = "miaguilapassword"
}
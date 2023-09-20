provider "aws" {
  region  = "us-east-1"
}
   
  
resource "aws_db_instance" "rds" {
  identifier             = "postgresdb"
  db_name                = "postgresdb"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "15.3"
  username               = "postgresuser"
  password               = "postgrespwd"
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.db-sg.id]
  parameter_group_name   = aws_db_parameter_group.dbpg.name
  availability_zone      = "us-east-1a"
  publicly_accessible    = false
  skip_final_snapshot    = true
}

resource "aws_instance" "ec2-web" {
    ami = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.main-subnet-public-1a.id
    security_groups = [aws_security_group.web-sg.id]
    vpc_security_group_ids = [aws_security_group.web-sg.id]
    key_name = "meukeypair"
    associate_public_ip_address = true
}
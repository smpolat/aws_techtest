resource "aws_db_instance" "db" {
    allocated_storage = 10
    engine = "mysql"
    engine_version = "5.7"
    instance_class = "db.t3.micro"
    db_name = var.db_name
    username = var.db_user
    password = var.db_pass
    db_subnet_group_name = aws_db_subnet_group.db.id
}

resource "aws_db_subnet_group" "db" {
    name = "db_subnet_group"
    subnet_ids = [
        aws_subnet.database-subnet-1.id,
        aws_subnet.database-subnet-2.id
    ]
}
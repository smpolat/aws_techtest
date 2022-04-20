locals {
  instance_type = "t2.micro"
}

data "aws_ami" "linux" {
    owners = ["amazon"]
    most_recent = true

    filter {
        name = "name"
        values = ["amzn-ami-hvm-*-x86_64-gp2"]
    }
}

resource "aws_autoscaling_group" "autoscaling_group" {
  launch_configuration = aws_launch_configuration.launch_configuration.id
  vpc_zone_identifier = [
    "${aws_subnet.application-subnet-1.id}",
    "${aws_subnet.application-subnet-2.id}"
  ]
  min_size = 2
  max_size = 5
  # load_balancers       = ["${aws_elb.elb.name}"]
  health_check_type = "ELB"
}

data "template_file" "user_data" {
  template = file("${path.module}/templates/user_data.tpl")
  vars = {
    bucket_url       = "s3://${aws_s3_bucket.wordpress.id}"
    db_host          = aws_db_instance.db.address
    db_name          = var.db_name
    db_user          = var.db_user
    db_pass          = var.db_pass
    auth_key         = var.auth_key
    secure_auth_key  = var.secure_auth_key
    logged_in_key    = var.logged_in_key
    nonce_key        = var.nonce_key
    auth_salt        = var.auth_salt
    secure_auth_salt = var.secure_auth_salt
    logged_in_salt   = var.logged_in_salt
    nonce_salt       = var.nonce_salt
  }
}

resource "aws_launch_configuration" "launch_configuration" {
  image_id      = data.aws_ami.linux.id
  instance_type = local.instance_type
  # security_groups      = ["${var.private_sg}"]
  iam_instance_profile = aws_iam_instance_profile.instance_profile.id
  user_data            = data.template_file.user_data.rendered

  lifecycle {
    create_before_destroy = true
  }
}



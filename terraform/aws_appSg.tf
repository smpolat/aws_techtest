resource "aws_security_group" "appSg" {
    vpc_id = "${aws_vpc.interview_vpc.id}"

# HTTPS access from anywhere
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

# Outbound Rules
# Internet access to anywhere
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "Application Tier Security Group"
    }

    lifecycle {
        create_before_destroy = true
    }
}
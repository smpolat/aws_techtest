# # Creating External LoadBalancer
resource "aws_lb" "external-alb" {
    name               = "external"
    internal           = false
    load_balancer_type = "application"
    security_groups    = [aws_security_group.appSg.id]
    subnets            = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]
}

resource "aws_lb_target_group" "target" {
    name     = "target"
    port     = 80
    protocol = "HTTP"
    vpc_id   = aws_vpc.interview_vpc.id
}

resource "aws_lb_listener" "public" {
    load_balancer_arn = aws_lb.external-alb.arn
    # port              = "443"
    # protocol          = "HTTPS"
    port = 80
    protocol = "HTTP"

    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.target.arn
    }
}

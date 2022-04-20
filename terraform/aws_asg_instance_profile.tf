resource "aws_iam_instance_profile" "instance_profile" {
  name = "instance_profile"
  role = aws_iam_role.instance.name
}

resource "aws_iam_role" "instance" {
  name = "instance_profile_role"
  path = "/"

  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  inline_policy {
    name   = "instance_capabilities"
    policy = data.aws_iam_policy_document.instance.json
  }

  permissions_boundary = "arn:aws:iam::615196324256:policy/dog-policy-policy-boundary"
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "instance" {
  statement {
    actions = ["s3:*"]
    resources = [
      aws_s3_bucket.wordpress.arn,
      "${aws_s3_bucket.wordpress.arn}/*"
    ]
  }
}

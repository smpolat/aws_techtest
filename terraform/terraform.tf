terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.10.0"
    }
  }

  backend "s3" {
    bucket         = "devopsgroups-interviewuser1-tfstate20220419205707219400000001"
    kms_key_id     = "arn:aws:kms:eu-west-1:615196324256:key/e31fd9d1-fd0a-4b3f-bc84-044a039db871"
    dynamodb_table = "devopsgroups-interviewuser1-tf_lock"
    region         = "eu-west-1"
    encrypt        = true
    key            = "terraform.tfstate"
  }
}
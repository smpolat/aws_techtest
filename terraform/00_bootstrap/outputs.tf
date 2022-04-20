output "state" {
    value =  <<EOF
bucket          = "${aws_s3_bucket.tf_state.id}"
kms_key_id      = "${aws_kms_key.tf_cmk.arn}"
dynamodb_table  = "${aws_dynamodb_table.tf_lock.name}"
region          = "eu-west-1"
encrypt         = true
EOF
}

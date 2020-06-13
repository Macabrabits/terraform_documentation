##referencing example
#terraform console
#aws_s3_bucket.my_s3_bucket.versioning[0].enabled  //outputs: true

#for changing an output u doesn need to compare your desired state (this file) with the actual state(the cloud state)
#so u can use $terraform apply --refresh=false

output "my_iam_user_details" {
  value = aws_iam_user.my_iam_user
}
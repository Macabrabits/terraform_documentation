##referencing example
#terraform console
#aws_s3_bucket.my_s3_bucket.versioning[0].enabled  //outputs: true

#for changing an output u doesn need to compare your desired state (this file) with the actual state(the cloud state)
#so u can use $terraform apply --refresh=false
output "aws_security_group_http_server_details" {
  value = aws_security_group.elb_sg
}

output "http_server_public_dns" {
  value = aws_instance.http_servers
}

output "elb_public_dns" {
  value = aws_elb.elb
}




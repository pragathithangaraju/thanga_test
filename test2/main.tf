resource "aws_s3_bucket" "demo1" {
    bucket = "test2-demo1" 
    acl = "private"  
versioning {
      enabled = false
   }
tags = {
     Name = "Bucket2"
     env= "prod2"
      }
}

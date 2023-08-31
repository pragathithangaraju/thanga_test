resource "aws_s3_bucket" "demos3" {
    bucket = "test3-demo2" 
    acl = "private"  
versioning {
      enabled = false
   }
tags = {
     Name = "Bucket1"
     env= "Prod15"
      }
}

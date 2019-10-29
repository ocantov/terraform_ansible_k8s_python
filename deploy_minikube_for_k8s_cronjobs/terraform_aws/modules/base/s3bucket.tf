# ---------------------------------------------------------------------------------------------------------------------
# S3 Bucket settings
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_s3_bucket" "bkp_store" {
  region        = var.region
  bucket        = var.s3bucket_name
  acl           = "private"
  force_destroy = true

  versioning {
    enabled = "true"
  }  
    tags         = map(
                                   "Name", join("_",[var._environment,"store"])
                                  )
}
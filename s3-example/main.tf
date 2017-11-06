provider "aws" {
  //ireland
  region = "${var.region}"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "bpk-super-bucket"
  acl = "public-read"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

locals {
  path-to-file="${path.module}/index.html"
}

resource "aws_s3_bucket_object" "object" {
  bucket = "${aws_s3_bucket.bucket.bucket}"
  key    = "index.html"
  source = "${local.path-to-file}"
//  etag   = "${md5(file("${local.path-to-file}"))}"
  acl = "public-read"

}

output "link" {
  value = "${aws_s3_bucket.bucket.website_endpoint}"
}
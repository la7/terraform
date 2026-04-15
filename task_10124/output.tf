output "bucket" {
  value = aws_s3_bucket.bucket.id
}

output "object" {
  value = aws_s3_object.object.id
}

output "rule_ids" {
  value = [
    for r in aws_s3_bucket_lifecycle_configuration.rule.rule : r.id
  ]
}

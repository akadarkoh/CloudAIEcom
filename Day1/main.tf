provider "aws" {
  region = "us-east-2"  # Change to your preferred region
}

# Generate a random suffix to ensure bucket name uniqueness
resource "random_id" "bucket_suffix" {
    byte_length = 8
}

# Create the S3 bucket with a unique name
resource "aws_s3_bucket" "ai_ecom_kofi_bucket" {
  bucket = "ai-ecom-kofi-bucket-${random_id.bucket_suffix.id}"

  # Add tags for better resource management
  tags = {
    Name        = "ai-ecom-kofi-bucket"
    Environment = "Dev"
  }
}

# Tables DynamoDB
resource "aws_dynamodb_table" "cloudmart_products" {
  name           = "cloudmart-products"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_dynamodb_table" "cloudmart_orders" {
  name           = "cloudmart-orders"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_dynamodb_table" "cloudmart_tickets" {
  name           = "cloudmart-tickets"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

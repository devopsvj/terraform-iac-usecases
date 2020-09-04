provider "aws" {
  region     = "ap-southeast-1"
  shared_credentials_file = "$HOME/.aws/credentials"
  profile                 = "default"
  version = ">=2.0"
}

variable "istest" {}

resource "aws_instance" "prod" {
  ami           = "ami-0cd31be676780afa7"
  instance_type = "t2.micro"
  # if var.istest is false, then create 1 instance, else 0 instance
  count = var.istest == false ? 1 : 0
}

resource "aws_instance" "dev" {
  ami           = "ami-0cd31be676780afa7"
  instance_type = "t2.large"
  # if var.istest is true, then create 1 instance, else 0 instance
  count = var.istest == true ? 1 : 0
}
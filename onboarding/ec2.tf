provider "aws" {
  region     = "ap-southeast-1"
  shared_credentials_file = "$HOME/.aws/credentials"
  profile                 = "default"
}

resource "aws_instance" "web" {
  ami           = "ami-0cd31be676780afa7"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "bae2cea567f04941649d370b0c05752b16753080"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-09-08 16:50:57"
    git_last_modified_by = "prakx_rj@yahoo.co.in"
    git_modifiers        = "prakx_rj"
    git_org              = "prakx87"
    git_repo             = "terragoat"
    yor_trace            = "31eebee3-e63c-41bf-9063-788ffba13e3e"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "bae2cea567f04941649d370b0c05752b16753080"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-09-08 16:50:57"
    git_last_modified_by = "prakx_rj@yahoo.co.in"
    git_modifiers        = "prakx_rj"
    git_org              = "prakx87"
    git_repo             = "terragoat"
    yor_trace            = "6e8ef095-0d58-4789-ac36-1405307dcb73"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

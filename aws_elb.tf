################### Create Instance ##########################
resource "aws_instance" "test-terraform" {
ami = "ami-8c122be9"
instance_type = "t2.micro"
subnet_id = "subnet-d59a3eaf"
source_dest_check = false
count = 2
connection {
user = "ec2-user"
key_file ="https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#KeyPairs:sort=keyName"
}
key_name = "XXX"
vpc_security_group_ids = ["sg-08b94a572ae5e8cc1"]
#user_data ="${file("/usr/terraform/user-data.sh")}"
tags {
Name = "test-terraform"
}
}

output "instanceid" {
  value = ["${aws_instance.test-terraform.*.id}"]
}
################# Create ELB #################################

resource "aws_elb" "bar" {
  name               = "foobar-terraform-elb"
  availability_zones = ["us-east-2a", "us-east-2b"]

  access_logs {
    bucket        = "foo"
    bucket_prefix = "bar"
    interval      = 60
  }

  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }

  

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = ["${aws_instance.test-terraform.*.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags {
    Name = "foobar-terraform-elb"
  }
}

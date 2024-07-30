resource "aws_ebs_volume" "volume" {
  availability_zone = "ap-southeast-1a"
  size              = 8
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.volume.id
  instance_id = aws_instance.ec2.id
}

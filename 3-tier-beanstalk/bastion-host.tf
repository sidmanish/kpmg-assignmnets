resource "aws_instance" "kpmg-bastion" {
    ami = var.ami
    instance_type = "t2.micro"
    key_name = "demo-key"
    subnet_id =  module.vpc.public_subnets[0]
    count = var.instance_count
    vpc_security_group_ids = [aws_security_group.kpmg-bastion-sg.id]

    tags = {
        Name = "kpmg-bastion"
        PROJECT = "kpmg"
    }

 provisioner "file" {
    content     = templatefile("templates/db-deploy.tmpl", { rds-endpoint = aws_db_instance.kpmg-rds.address, dbuser = var.dbuser, dbpass = var.dbpass })
    destination = "/tmp/kpmg-dbdeploy.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/kpmg-dbdeploy.sh",
      "sudo /tmp/kpmg-dbdeploy.sh"
    ]
  }

  connection {
    user        = var.USERNAME
    private_key = file(var.PRIV_KEY_PATH)
    host        = self.public_ip
  }
  depends_on = [aws_db_instance.kpmg-rds]
}
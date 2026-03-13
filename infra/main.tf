# --- Project 1: S3 Bucket ---

resource "aws_s3_bucket" "homelab_bucket" {
bucket = "mythirdterraformbucket2"

tags = {
  Environment = "tf"
}
}

# --- Project 2: Web Server ---
resource "aws_instance" "web" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"

  tags = {
    Name = "homelab-python-server"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install python3 -y
              pip3 install flask
              cat <<PYTHON > /home/ec2-user/app.py
              from flask import Flask
              app = Flask(__name__)
              @app.route("/")
              def hello():
                  return "Hello from AWS HomeLab!"
              if __name__ == "__main__":
                  app.run(host="0.0.0.0", port=80)
              PYTHON
              python3 /home/ec2-user/app.py
              EOF
}
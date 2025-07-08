#!/bin/bash
# Update packages
sudo apt update -y

# Install Nginx
sudo apt install nginx -y

# Enable and start Nginx
sudo systemctl enable nginx
sudo systemctl start nginx

# Create index.html
cat <<EOF | sudo tee /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>EC2 Nginx Page</title>
  <style>
    body {
      background-color: #222;
      color: #fff;
      font-family: Arial, sans-serif;
      text-align: center;
      padding-top: 100px;
    }
    h1 {
      font-size: 50px;
      color: #00ffcc;
    }
  </style>
</head>
<body>
  <h1>Hello from EC2 👋</h1>
  <p>This page is served by Nginx running on your EC2 instance.</p>
</body>
</html>
EOF

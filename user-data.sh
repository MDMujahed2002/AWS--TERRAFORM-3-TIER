#!/bin/bash
apt update -y
apt install -y nginx

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>EC2 Servers - Cloud Solutions</title>
  <style>
    * { box-sizing: border-box; }
    body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; margin: 0; padding: 0; background: #d0f0d0; color: #222; }
    header { background: #2e7d32; color: white; padding: 1.5rem; text-align: center; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
    header h1 { margin: 0; font-size: 2.2rem; }
    nav { margin-top: 1rem; }
    nav a { color: white; margin: 0 1.5rem; text-decoration: none; font-weight: bold; font-size: 1.1rem; transition: color 0.3s ease; cursor: pointer; }
    nav a:hover { color: #a5f2a5; }
    section { padding: 3rem 2rem; max-width: 900px; margin: auto; background: white; box-shadow: 0 4px 10px rgba(0,0,0,0.05); margin-top: 2rem; border-radius: 10px; }
    footer { background: #2e7d32; color: white; text-align: center; padding: 1.5rem; margin-top: 3rem; }
    form { display: flex; flex-direction: column; max-width: 500px; margin: auto; gap: 1rem; }
    input, textarea { padding: 0.75rem; font-size: 1rem; border: 1px solid #ccc; border-radius: 5px; }
    button { padding: 0.9rem; background: #388e3c; color: white; border: none; border-radius: 5px; cursor: pointer; font-size: 1rem; transition: background 0.3s ease; }
    button:hover { background: #2e7d32; }
  </style>
</head>
<body>
  <header>
    <h1>EC2 Servers</h1>
    <nav>
      <a href="#home">Home</a>
      <a href="#about">About</a>
      <a href="#contact">Contact</a>
    </nav>
  </header>

  <section id="home">
    <h2>Welcome to EC2 Servers</h2>
    <p>EC2 Servers offers powerful, scalable, and secure cloud compute solutions for all your infrastructure needs.</p>
    <p>Explore our services to transform your business into a cloud-native platform.</p>
  </section>

  <section id="about">
    <h2>About EC2 Servers</h2>
    <p>We are a team of certified cloud professionals with deep expertise in deploying, managing, and optimizing EC2 instances.</p>
    <ul>
      <li>Auto-Scaling & High Availability</li>
      <li>Secure VPC Networking</li>
      <li>Custom AMI & Launch Templates</li>
      <li>Infrastructure as Code with Terraform</li>
    </ul>
  </section>

  <section id="contact">
    <h2>Contact EC2 Experts</h2>
    <form onsubmit="alert('Message sent!'); return false;">
      <label for="name">Name:</label>
      <input type="text" id="name" required />
      <label for="email">Email:</label>
      <input type="email" id="email" required />
      <label for="message">Message:</label>
      <textarea id="message" rows="5" required></textarea>
      <button type="submit">Send Message</button>
    </form>
  </section>

  <footer>
    <p>&copy; 2025 EC2 Servers | Powered by AWS Cloud</p>
  </footer>
</body>
</html>
EOF

systemctl enable nginx
systemctl restart nginx

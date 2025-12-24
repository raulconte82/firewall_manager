Firewall Manager (UFW Interactive Bash Script)

This project is an interactive Bash script designed to simplify the management of UFW (Uncomplicated Firewall) on Linux systems.

The script was created and tested on Debian 13 (Trixie).
For best compatibility, make sure your system is using Bash as the default shell.

📋 Requirements

Linux system with Bash

ufw (can be installed directly from the script)

sudo privileges

Optional (recommended)

Before running the script, you may update your system:

sudo apt update && sudo apt upgrade -y


This step is optional but recommended to keep your system up to date.

🚀 Installation & Usage

Download the file firewall_manager.sh into any directory you prefer.

Grant execution permissions:

sudo chmod +x firewall_manager.sh


Run the script:

sudo ./firewall_manager.sh


⚠️ Note: The script must be executed with sudo because firewall operations require elevated privileges.

🎯 Purpose of the Script

This tool was created to learn, validate, and control firewall behavior in a clear and interactive way.

For example:

Testing websites without Cloudflare or CDN protection

Verifying whether a specific IP or port is truly blocked

Understanding the difference between incoming and outgoing traffic

Experimenting safely with UFW rules and easily reverting changes

🧠 Why These Extra Features Exist

The script includes additional diagnostic options to make firewall management easier and more transparent:

Display network device names (LAN / Wi-Fi)

Show private (internal) IP

Show public (external) IP

Resolve websites (DNS) to IP addresses

Convert domain names into IPs for easy use in UFW rules

Quickly inspect, add, remove, reload, or reset firewall rules

These features help you understand exactly what you are blocking or allowing before applying firewall rules.

🔐 Traffic Direction Explained

Incoming (IN):
Controls connections coming from outside into your system

Outgoing (OUT):
Controls connections from your system to external destinations, such as websites or remote services

Understanding this distinction is key to using UFW correctly.

⚠️ Important Notes

Blocking a website by IP may not always work, especially with modern websites using CDNs or multiple IPs

This script focuses on firewall-level control, not DNS or content filtering

Ideal for learning, auditing, testing, and interviews, not ad-blocking

👨‍💻 Author

Created by Raul Conte
Focused on clarity, learning, and safe firewall experimentation.

✨ Final Message

“Remember, Raul Conte — the best and happy to help you.”

Enjoy exploring UFW and Linux firewall concepts 🚀
ENJOY!!!

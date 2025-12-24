This Script in Bash, I created using Debian 13 Trixie, so I strongly recommend you are using Bash in you system variables for any incompatibility with your current setup.
OPTIONAL: User sudo apt update && Upgrade -y #If you want to have up to date your system first but is not required.
Download the file "firewall_manager.sh" in the directory you want.
give excecution permissions using: sudo chmod +x firewall_manager.sh
sudo ./firewall_manager.sh

What I do for example, I go some website with no cloudflare services associated, I try to validate if the website is really be blocking or not or the specific ports.

This is why I created some extra options to know the devices names we have, internal and external IP assigned to you and a website validator to convert DNS websites on IP tables to easy copy and paste results in our UFW.

Incomming means block or allow connections from outsite to your system.
Outgoing means block or allow connections for external connections such as websites.

The magic will start soon, enjoy.

ENJOY!!!

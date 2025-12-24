#!/bin/bash

# ==============================
# UFW FIREWALL MANAGER
# Created by Raul Conte
# ==============================

GREEN="\e[32m"
RED="\e[31m"
NC="\e[0m"

pause() {
    echo
    read -rp "Press ENTER to return to main menu..."
}

header() {
    clear
    echo -e "${GREEN}"
    echo "================================================="
    echo "        UFW FIREWALL MANAGER"
    echo "        Created by Raul Conte"
    echo "================================================="
    echo -e "${NC}"
}

# 1) Devices names
devices() {
    header
    ip -brief link
    pause
}

# 2) Private IP
private_ip() {
    header
    hostname -I
    pause
}

# 3) Public IP
public_ip() {
    header
    curl -s ifconfig.me || echo "Unable to get public IP"
    echo
    pause
}

# 4) Find website IP
find_website_ip() {
    header
    read -rp "Enter website (example.com): " site
    dig +short "$site"
    pause
}

# 5) Check UFW installation
check_ufw_installed() {
    header
    if command -v ufw >/dev/null 2>&1; then
        echo -e "${GREEN}UFW is installed${NC}"
    else
        echo -e "${RED}UFW is NOT installed${NC}"
    fi
    pause
}

# 6) Check UFW service
check_ufw_service() {
    header
    ufw status verbose
    pause
}

# 7) Show UFW rules
show_rules() {
    header
    ufw status numbered
    pause
}

# 8) Allow incoming IP
allow_in_ip() {
    header
    read -rp "Enter IP to ALLOW incoming: " ip
    ufw allow from "$ip"
    pause
}

# 9) Deny incoming IP
deny_in_ip() {
    header
    read -rp "Enter IP to DENY incoming: " ip
    ufw deny from "$ip"
    pause
}

# 10) Allow outgoing IP
allow_out_ip() {
    header
    read -rp "Enter IP to ALLOW outgoing: " ip
    ufw allow out to "$ip"
    pause
}

# 11) Deny outgoing IP
deny_out_ip() {
    header
    read -rp "Enter IP to DENY outgoing: " ip
    ufw deny out to "$ip"
    pause
}

# 12) Allow incoming port
allow_in_port() {
    header
    read -rp "Enter port to ALLOW incoming: " port
    ufw allow "$port"
    pause
}

# 13) Deny incoming port
deny_in_port() {
    header
    read -rp "Enter port to DENY incoming: " port
    ufw deny "$port"
    pause
}

# 14) Delete all rules
delete_all_rules() {
    header
    read -rp "This will DELETE ALL RULES. Continue? (y/n): " c
    if [[ "$c" == "y" ]]; then
        ufw reset
        ufw enable
        echo -e "${GREEN}All rules deleted and UFW re-enabled${NC}"
    fi
    pause
}

# 15) Disable UFW
disable_ufw() {
    header
    ufw disable
    echo -e "${RED}UFW disabled${NC}"
    pause
}

# 16) Start UFW
start_ufw() {
    header
    ufw enable
    pause
}

# 17) Enable UFW at startup
enable_startup() {
    header
    systemctl enable ufw
    echo -e "${GREEN}UFW enabled at startup${NC}"
    pause
}

# 18) Reload UFW
reload_ufw() {
    header
    ufw reload
    echo -e "${GREEN}UFW reloaded${NC}"
    pause
}

# ==============================
# MAIN MENU
# ==============================
while true; do
    header
    echo "1)  Check device names (LAN / WIFI)"
    echo "2)  Show private IP"
    echo "3)  Show public IP"
    echo "4)  Find website IP"
    echo "5)  Check UFW installation"
    echo "6)  Check UFW service"
    echo "7)  Show UFW rules"
    echo "8)  Allow incoming IP"
    echo "9)  Deny incoming IP"
    echo "10) Allow outgoing IP"
    echo "11) Deny outgoing IP"
    echo "12) Allow incoming ports"
    echo "13) Deny incoming ports"
    echo "14) Delete all existing rules"
    echo "15) Disable UFW"
    echo "16) Start UFW"
    echo "17) Enable UFW at startup"
    echo "18) Reload UFW rules"
    echo "19) Exit"
    echo
    read -rp "Choose an option: " opt

    case $opt in
        1) devices ;;
        2) private_ip ;;
        3) public_ip ;;
        4) find_website_ip ;;
        5) check_ufw_installed ;;
        6) check_ufw_service ;;
        7) show_rules ;;
        8) allow_in_ip ;;
        9) deny_in_ip ;;
        10) allow_out_ip ;;
        11) deny_out_ip ;;
        12) allow_in_port ;;
        13) deny_in_port ;;
        14) delete_all_rules ;;
        15) disable_ufw ;;
        16) start_ufw ;;
        17) enable_startup ;;
        18) reload_ufw ;;
        19)
            clear
            echo "Remember, Raul Conte the best and happy to help you"
            exit 0
            ;;
        *) echo "Invalid option"; sleep 1 ;;
    esac
done


# RasPi Shield

**RasPi Shield** is a self-hosted password manager project using a Raspberry Pi 5 and Vaultwarden.

## Features

- Local-first password manager with no cloud dependency
- Secure login and credential sharing using Vaultwarden
- DNS privacy with Pi-hole + Unbound
- Remote access enabled via PiVPN
- HTTPS support via Nginx reverse proxy and Let's Encrypt
- Designed for privacy-conscious users and small teams

## Hardware Used

- Raspberry Pi 5 (4GB)
- 64GB microSD card
- Ethernet connection

## Project Structure

- `vaultwarden/`: Vaultwarden Docker setup
- `nginx/`: Reverse proxy config and SSL certs
- `pihole/`: Pi-hole installation and config scripts
- `vpn/`: PiVPN setup and user configs
- `docs/`: Installation guides and screenshots

## Authors

- Nhat Huy Mai Phan (Team Lead)
- Tiffany Phuong Uyen Le
- Tyas Marion
- Ennio Cardozo Rivera
- Lemuel Hernandez Rodriguez
- Elizabeth Oghenefejiro Ovueni

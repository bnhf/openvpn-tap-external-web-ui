# OpenVPN-TAP-external-web-ui

## Summary
OpenVPN TAP (bridge) external (non-Docker) server web administration interface.

Goal: create quick to deploy and easy to use solution that makes work with small OpenVPN environments a breeze.

If you have docker and Portainer installed, you can jump directly to [installation](#Prod).

![Status page](docs/images/screenshot-brix-pc2_8080-2022.02.03-16_09_24.png?raw=true)

Please note this project is in alpha stage. It still needs some work to make it secure and feature complete.
If you have a functioning OpenVPN TAP Server on the same host as your Docker containers, you should be able
to use this fork to monitor OpenVPN connections. Certificate generation and management is not finished.

## Motivation

* to create a version of this project that will work with OpenVPN TAP servers

## Features

* status page that shows server statistics and list of connected clients
* easy creation of client certificates
* ability to download client certificates as a zip package with client configuration inside
* log preview
* modification of OpenVPN configuration file through web interface
* this fork is designed to use an external version of OpenVPN configured for TAP (bridge) -- which is not possible with Docker

## Screenshots

[Screenshots](docs/screenshots.md)

## Usage

After startup web service is visible on port 8080. To login use the following default credentials:

* username: admin
* password: b3secure (this will be soon replaced with random password)

Please change password to your own immediately!

### Prod

Requirements:
* docker and Portainer
* on firewall open ports: 1194/udp and 8080/tcp

Setup your Portainer Stacks page as shown, inserting environment variables for creating certificates:

![Status page](docs/images/screenshot-brix-pc2_9443-2022.02.03-15_35_24.png?raw=true)


It starts two docker containers. One with OpenVPN server and second with OpenVPNAdmin web application. Through a docker volume it creates following directory structure:


    .
    ├── docker-compose.yml
    └── openvpn-data
        ├── conf
        │   ├── dh2048.pem
        │   ├── ipp.txt
        │   ├── keys
        │   │   ├── 01.pem
        │   │   ├── ca.crt
        │   │   ├── ca.key
        │   │   ├── index.txt
        │   │   ├── index.txt.attr
        │   │   ├── index.txt.old
        │   │   ├── serial
        │   │   ├── serial.old
        │   │   ├── server.crt
        │   │   ├── server.csr
        │   │   ├── server.key
        │   │   └── vars
        │   ├── openvpn.log
        │   └── server.conf
        └── db
            └── data.db



### Dev

Requirements:
* [golang environments](https://www.digitalocean.com/community/tutorial_series/how-to-code-in-go)
* [beego](https://beego.vip/)
* [bee](https://github.com/beego/bee)

Execute commands:

    go get -u github.com/bnhf/openvpn-tap-external-web-ui
    cd $GOPATH/src/github.com/bnhf/openvpn-tap-external-web-ui
    go mod tidy
    bee run -gendoc=true

## Todo

* add unit tests
* add option to modify certificate properties
* generate random admin password at initialization phase
* add versioning
* add automatic ssl/tls (check how [ponzu](https://github.com/ponzu-cms/ponzu) did it)


## License

This project uses [MIT license](LICENSE)

## Remarks

### Vendoring
https://github.com/kardianos/govendor is used for vendoring.

To update dependencies from GOPATH:

`govendor update +v`

### Template
AdminLTE - dashboard & control panel theme. Built on top of Bootstrap 3.

Preview: https://almsaeedstudio.com/themes/AdminLTE/index2.html


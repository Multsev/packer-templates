<!-- PROJECT LOGO -->
<br />
<p align="center">
  <h3 align="center">Packer Template Collection</h3>

  <p align="center">
    An awesome README template to jumpstart your projects!
  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Usage](#usage)
* [Acknowledgements](#acknowledgements)



<!-- ABOUT THE PROJECT -->
## About The Project

Packer templates for building machine images and Vagrant baseboxes for HyperV, VirtualBox, Parallels, VmWare and KVM.

### Built With
* [Packer](https://getbootstrap.com)

<!-- GETTING STARTED -->
## Getting Started

### Prerequisites
* Packer

Install for Linux
```sh
export PACKER_VER="1.5.4"
curl -L "https://releases.hashicorp.com/packer/${PACKER_VER}/packer_${PACKER_VER}_linux_amd64.zip" -o packer.zip && sudo unzip packer.zip -d "/usr/sbin" && rm -f packer.zip
```

Install for Windows
```sh
$PACKER_VER="1.5.4"
Invoke-WebRequest -Uri "https://releases.hashicorp.com/packer/${PACKER_VER}/packer_${PACKER_VER}_windows_amd64.zip" -OutFile "$env:USERPROFILE/packer.zip"
Expand-Archive -Path "$env:USERPROFILE/packer.zip" -DestinationPath "C:\Program Files"
```

### Installation

1. Clone the repo
```sh
git clone https://github.com/Multsev/packer-templates.git
```
3. Start builds
```sh
packer --only=Builder -var-file=./template/OS/Version ./template/OS/OS
```

<!-- USAGE EXAMPLES -->
## Usage

Run build's centos
```sh
packer --only=qemu -var-file=./template/centos/8.1-x86_64.json ./template/centos/centos.json
```
Run build's ubuntu
```sh
packer --only=qemu -var-file=./template/centos/19.10-amd64.json ./template/centos/ubuntu.json
```
Run build's windows
```sh
packer --only=qemu -var-file=./template/centos/10.json ./template/centos/windows.json
```
<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [Packer](https://getbootstrap.com)
* [Vagrant](https://www.vagrantup.com/)





<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

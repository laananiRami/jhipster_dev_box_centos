# JHipster official "development box"

## Introduction

This is a [Vagrant](https://www.vagrantup.com/) configuration to set up a complete, virtualized development environment 
for JHipster users.

1. [Usage](#usage)
2. [Installation](#setup)
3. [Customize your virtual machine](#customize)
4. [Configure your new box and install new software](#configure)

## <a name="usage"></a> Usage

The JHipster "development box" is a complete development environment for JHipster users.

It requires to have [Vagrant](https://www.vagrantup.com/) installed on your machine.

It is fully based on Open Source software, most importantly:

- CentOs 7
- Oracle JDK
- Yarn, NPM, Bower and Gulp
- Docker and Docker Compose (see the [JHipster Docker Compose documentation](http://jhipster.github.io/docker-compose/) to learn 
how to run your application, database or even a full micro-service architecture with Docker)


This "development box" also have all client applications useful for working with a JHipster application:

- Heroku toolbelt

## <a name="setup"></a> Installation

The "Quick installation" provides a pre-build Virtual Machine, and the "Manual installation" let you build your Virtual Machine yourself. We recommend you use the "Quick installation" if you don't know which option to choose.

### Quick installation

Pre-built distributions of this "development box" are available on [Atlas](https://atlas.hashicorp.com/centos/boxes/7).

To install the latest distribution, please run:

On Mac or Linux

`vagrant init centos/7; vagrant up --provider virtualbox`

On Windows

`vagrant init centos/7`

`vagrant up --provider virtualbox`

You can then tune your installation, by following the next sections on customizing and configuring your "development box".

### Manual installation

This generates a new "development box" directly from this repository.

- Clone this repository: `https://github.com/ramiJasmine/jhipster_dev_box_centos.git`
- Run `vagrant up`

## <a name="customize"></a> Customize your virtual machine

This is very important! Modify your system properties, depending on your host's hardware. We recommend, at least:

- 4 CPUs
- 8 Gb of RAM
- 128 Mb of video RAM

## <a name="configure"></a> Configure your new box and install new software

Start up the new box:

- Login using the `vagrant` user (The default user created by vagrant)
  - Password is `vagrant` (please note that default keyboard layout is US!)
- Generate your application
  - Run `yo jhipster` and use JHipster normally
- Configure your database
  - Run your database with Docker. For example, for MySQL use `docker-compose -f src/main/docker/mysql.yml up`
  - In your application, don't forget to edit your `application-dev.yml` and `application-prod.yml` files so you have the correct connection setup for your database server
- Use the JHipster tools
  - Running `./mvnw` will run your JHipster application on port `8080`. As this port is forwarded to your host, you can also use `http://localhost:8080` on your host machine
  - Running `gulp` will launch your AngularJS front-end with BrowserSync on port `9000`: it is also forwarded to your host, so you can also use `http://localhost:9000` on your host machine

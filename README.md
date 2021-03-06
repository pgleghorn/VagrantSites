# DockerSites
This repo contains Dockerfiles and scripts to perform a fully unattended installation of Oracle WebCenter Sites including OS, application server, DB, Sites and patches.

It produces an Oracle WebCenter Sites 11.1.1.8.0 patch 11 development installation (editorial, delivery and rss) with cas, AviSports sample site, and optionally support tools 4.4. It uses java 1.7, tomcat 7 and hsqldb 1.8, on centos 6.

It does not require any kits to be downloaded, instead they are downloaded automatically using Oracle website credentials (freely available). A docker-compose.yml file is used to start up multiple simultaneous containers.

See a video of the Docker method at https://www.youtube.com/watch?v=giVgmc10qv4 (2015-11-29 build f8014f5)

*These scripts are not an official Oracle product, and the stack they produce is not supported (centos, hsqldb).*

### Usage

1. Install docker and docker-compose
2. Clone this repository, e.g. git clone https://github.com/pgleghorn/VagrantSites.git
3. Set environment variables ORACLE_USER and ORACLE_PASSWORD with your oracle credentials.
4. Edit config.sh and change any required params
5. Build the docker images with:  ./buildDockerImage.sh
6. Edit docker-compose.yml and define the instances to startup (e.g. editorial:5001, and delivery:5002)
7. Startup with: docker-compose up

To reach Sites you will need to add a local hosts mapping to point to the hostname(s) selected in docker-compose.yml. Note that since Sites needs to know at install-time which host:port it lives at, using docker port mapping to set a different host vs container port will not work, Sites will redirect the user to the port it knows about.

### Todo

* ~~smarter install, dont run twice but instead wait for tomcat startup then continue~~
* ~~dont presume 192.168.x.x network~~
* ~~more configurable (user, directory, port, hostname, etc)~~
* ~~move configurable items into a hiera config file -> .sh file~~
* ~~install supporttools~~
* ~~enable asset forms in admin UI~~
* ~~echo script to run as root in host, to add ip address for v8 to /etc/hosts~~
* ~~rss~~
* httpd / ohs
* ansible-ize it all: os / tomcat / sites / patch
* further ansible-ize'ing: httpd / vanity url config
* further platform: oel / wls / oraclexe db
* leave behind scripts for easy cmd line catalogmover & csdt
* ssl
* openldap / active directory integration
* wine & sites explorer
* eclipse integration
* clusters
* analytics
* psi-probe
* ~~dont require cygwin/linux~~
* ~~proper xml file editing (eg augeas) not sed~~
* dont bake oracle credentials into the docker image history
* ~~vagrantfile should be able to downloads kits also~~
* reintroduce vagrant
* put on dockerhub
* test on more host platforms
* expand to include sites12c
* ~~split dockerfile into multiple images (base download of kits, vs install/configure)~~
* some way to facilitate proper docker port mapping at runtime
* ~~docker-compose for startup~~
* ~~multiple simultaneous containers~~
* ~~set host:port dynamic on first startup, startupDynamic.sh~~
* use michele's netcat trick instead of hacky wait.sh
* update for latest patch
* need runtime update of SystemSatellite and WebRoots tables

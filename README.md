# squid-proxy
Super Simple Transparent Squid Proxy

## Why?
Some applications when run in Docker use the hosts internal networking. This is troublesome if the system you're on is not aware of this internal networking and you don't want to configure port forwards or run a seperate browser session from the Docker host.

Docker on OSX is a good example of this, since the Docker containers will run within a VirtualBox VM and your Mac may not know how to access the internal containers IPs.

A practical example is following the [Rancher ELK Guide](http://rancher.com/running-our-own-elk-stack-with-docker-and-rancher/) on a seperate Docker host and trying to access the Kopf container from your local systems web browser.

## Usage

Start Docker container
```
docker run -d -p 3128:3128 squid-proxy
```

Configure web browser to use proxy address, for instance on Chrome/Chromium,

```
chromium -d --proxy-server="dockerhost:3128" --user-data-dir=/var/tmp/null
```

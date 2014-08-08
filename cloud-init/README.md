# Useful cloud-init data files

Cloud-init is a tool which is used to perform some one-time initial
configuration of a freshly created cloud instance.  It's useful for
installing packages, creating configuration files and other small but
important tasks.  It is not really a replacement for Chef or Puppet
configuration management tools, but can be used to bootstrap these
tools.

* userdata-devel.txt: Create a Debian or Ubuntu development
  environment.  It installs essential build tools and configures the
  node to run a HTTP proxy using polipo.

* userdata-chef-server.txt: Installs an Opscode Chef server for Ubuntu
  Precise (12.04)

* userdata-chef-client.txt: Installs the Opscode Chef client for
  Ubuntu or Debian systems

* userdata-sid-from-wheezy.txt: Upgrades a Debian Wheezy (stable) node
  to Debian Sid (unstable)

#!/bin/sh
mkdir ~/.chef
cp cookbooks/conf/files/default/solo.rb ~/.chef
cp cookbooks/conf/files/default/node.json ~/.chef
chef-solo -c ~/.chef/solo.rb -j ~/.chef/node.json

#!/usr/bin/python

import sys, redis

rd = redis.Redis()

rd.publish('log:%s' % sys.argv[1], sys.argv[2])

#!/usr/bin/python

import sys, redis

rd = redis.Redis()

rd.subscribe(['log:info', 'log:warn', 'log:error'])

for k in rd.listen():

    if k[0] == 'subscribe':
        continue
    
    if k[0] == 'message':
        level = k[1].split(':')[1]
        print '>>> %s: %s' % (level, k[2])
        continue

    print 'Unknown message', k

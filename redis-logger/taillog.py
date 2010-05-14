#!/usr/bin/python

import sys
import redis, optparse

# Command line args

optparser = optparse.OptionParser()

optparser.add_option('-f', '', dest = 'follow', action = 'store_true')

optparser.add_option('-n', '', dest = 'number', action = 'store', type = 'int',
                     default = 10)

opts, argv = optparser.parse_args()

if len(argv) != 1:
    print 'Usage: taillog.py [-f] [-n NUMBER] SEVERITY'
    sys.exit(1)

severity = argv[0]

# Display tail of log

rd = redis.Redis()

for entry in rd.zrange('log:%s:backlog' % severity, -opts.number, -1):
    print entry

# Follow new messages

if opts.follow:

    rd.subscribe('log:%s' % severity)

    for k in rd.listen():

        if k[0] == 'subscribe':
            continue

        if k[0] == 'message':
            print k[2]
            continue

        print 'Unknown message', k

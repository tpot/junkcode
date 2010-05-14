#!/usr/bin/python

import sys, datetime
import redis, simplejson

severity = sys.argv[1]          # info, warning, error
message = sys.argv[2]

# Timestamp is score

now = datetime.datetime.today()
score = '%d%02d%02d%02d%02d%02d%06d' % \
    (now.year, now.month, now.day, now.hour, now.minute, 
     now.second, now.microsecond)

# Create log entry

entry = simplejson.dumps({'time': score, 'msg': message})

rd = redis.Redis()

pipe = rd.pipeline()

pipe.zadd('log:%s:backlog' % severity, entry, score)
pipe.publish('log:%s' % severity, entry)
pipe.execute()

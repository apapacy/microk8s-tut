#!/bin/sh

haproxy -D -f ./haproxy/haproxy.cfg -p `pwd`/haproxy.pid -sf $(cat `pwd`/haproxy.pid)
ls -halt

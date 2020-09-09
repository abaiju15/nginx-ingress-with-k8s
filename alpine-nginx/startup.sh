#!/usr/bin/env ash

openrc > /dev/null 2>&1
touch /run/openrc/softlevel
service incrond start
nginx
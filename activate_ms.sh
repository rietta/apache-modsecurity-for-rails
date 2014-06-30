#!/bin/bash
cd $1
p=`pwd`
for f in * ; do ln -s $p/$f /etc/modsecurity/activated_rules/$f ; done

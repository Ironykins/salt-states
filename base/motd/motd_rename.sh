#!/bin/sh

sed -i -e 's/<<Placeholder>>/$1/g' /etc/update-motd.d/00-header


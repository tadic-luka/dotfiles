#!/bin/bash

# $1 - namespace name
# $2 - interface name
#add new namespace
ip netns add "$1"

#set interface to namespace, now programs outside namespace cannot see
#interface
ip link set "$2" netns "$1"

#bring up interface inside namespace
ip netns exec "$1" ip link set "$2" up

#use dhcp to get an ipv4 adress for interface
ip netns exec "$1" dhclient "$2"

# example command
# ip netns exec 'namesace name' ping google.com 
# it will execute command ping google.com inside this namespace


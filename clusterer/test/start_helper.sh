#!/bin/sh
nohup iex --sname foo@localhost --cookie $1 -S mix &
echo $! > .pid

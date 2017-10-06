#!/bin/sh
kill -9 "$(cat .pid)"
rm .pid

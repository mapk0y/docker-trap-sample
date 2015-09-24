#!/bin/bash

trap "echo stopping by SIGTERM" SIGTERM
trap "echo stopping by SIGINT" SIGINT
trap "echo stopping by SIGKILL" SIGKILL

echo "start sleep"
sleep 1000 &
child=$!
wait "$child"

echo "stop sleep"

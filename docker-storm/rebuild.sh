#!/bin/bash

docker build -t="gree2/storm"            storm
docker build -t="gree2/storm-nimbus"     storm-nimbus
docker build -t="gree2/storm-supervisor" storm-supervisor
docker build -t="gree2/storm-ui"         storm-ui

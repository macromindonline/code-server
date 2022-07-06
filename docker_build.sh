#!/bin/bash
docker image rm macromind-code-server
docker build . -t macromind-code-server

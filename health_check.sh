#!/usr/bin/bash

set -e

ps aux | grep -v grep | grep "nginx: worker process"
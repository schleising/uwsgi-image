#!/bin/zsh
docker run --name uwsgi --network schleising-net -v /Users/steve/Documents/Coding/Python/website/mainsite/:/code/ uwsgi-image

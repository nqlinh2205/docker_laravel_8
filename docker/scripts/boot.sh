#!/bin/bash

# Boot
docker exec webike_nginx nginx -s reload
docker restart webike_app

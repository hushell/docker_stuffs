#!/bin/bash
# Print container info. Adapt $FORMAT to modify the output.
# It might be useful to check sudo docker inspect <container id>
# for the possible fields.

FORMAT='{{.Id}};{{.Config.User}};{{.Config.Image}};{{ range .HostConfig.DeviceRequests }} {{.DeviceIDs}} {{end}}'
sudo docker ps \
| tail -n+2 \
| awk '{print $1}' \
| parallel --will-cite "sudo docker inspect --format='$FORMAT' {}" \
| column -s';' -t \
| sort -k4

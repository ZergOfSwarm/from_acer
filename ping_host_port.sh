server_ip=82.181.62.216
server_port=1194

if nc -w1 -z $server_ip $server_port; then
  echo "Port is listening"
else
  echo "Port is NOT listening"
fi

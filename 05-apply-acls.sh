vault token create -policy admin -ttl 1h -display-name admin -id secretadmintoken
vault token create -policy developer -ttl 1h -display-name developer -id secretdevelopertoken
vault token create -policy default -ttl 1h -display-name default -id secretdefaulttoken

# Docker Service Logger
Dockereized simple script to monitor and log swarm services. the logs are written to the system output and can be transferred monitoring system such as ELK/splunk

## Log format
the log is in json format and contain the following fields:
* service - the name of the service
* mode - the mode of deployment of the service (global/replicated)
* replicas_text - number of running instances as text for display
* running - number of running instances
* total - the total number of instances which should run
* running_pct - perecentage of running instance out of total

### example logs 
```
{"service":"metricbeat","mode":"global","replicas_text":"5/5","running":5,"total":5,"running_pct":1}
{"service":"redis","mode":"replicated","replicas_text":"3/4","running":3,"total":4,"running_pct":0.75}
```

## How to run
Run from command line:
```
docker run -d -v /var/run/docker.sock:/var/run/docker.sock docker-logger
```
Or run using compose file
```
version: '3.7'
services:
  services-logger:
    image: 'docker-logger:latest'
      volumes:
        - /var/run/docker.sock:/var/run/docker.sock
      deploy:
        replicas: 1
        placement:
          constraints:
            - node.role == manager
```

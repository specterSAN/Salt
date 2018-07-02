#!/bin/bash
pass=`sudo cat /var/lib/jenkins/secrets/initialAdminPassword` && echo 'jenkins.model.Jenkins.instance.securityRealm.createAccount("specter", "pass")' 
java -jar /var/cache/jenkins/war/WEB-INF/jenkins-cli.jar -auth admin:$pass -s http://127.0.0.1:8080/ install-plugin maven-plugin deploy git github -restart
java -jar /var/cache/jenkins/war/WEB-INF/jenkins-cli.jar -auth admin:$pass -s http://localhost:8080/ groovy =
sleep 30s
systemctl restart jenkins

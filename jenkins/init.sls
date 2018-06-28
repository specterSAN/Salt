Add Jenkins key:
  pkg.add_repo_key:
  - name: Jenkins KEY
  - path: https://pkg.jenkins.io/debian/jenkins-ci.org.key 

Echo deb:
  file.append:
  - name: /etc/apt/sources.list.d/jenkins.list
  - text: deb https://pkg.jenkins.io/debian-stable binary/
   
Apt Update:
  pkg.latest:
  - refresh: True
  - cache_valid_time: 300 #New in version 2016.11.0

Apt Upgrade:
  pkg.upgrade:
  - refresh: True




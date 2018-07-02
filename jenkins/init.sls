Add Jenkins key:
  pkg.add_repo_key:
  - name: Jenkins KEY
  - path: https://pkg.jenkins.io/debian/jenkins-ci.org.key 

Echo deb:
  file.append:
  - name: /etc/apt/sources.list.d/jenkins.list
  - text: deb https://pkg.jenkins.io/debian-stable binary/
   
Apt Update:
  module.run:
  - name: okg.refresh_db




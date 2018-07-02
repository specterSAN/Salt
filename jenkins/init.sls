jenkins_repo:
  pkgrepo.managed:
   - file: /etc/apt/sources.list.d/jenkins.list
   - name: deb https://pkg.jenkins.io/debian-stable binary/
   - key_url: https://pkg.jenkins.io/debian/jenkins-ci.org.key

Echo deb:
  file.append:
  - name: /etc/apt/sources.list.d/jenkins.list
  - text: deb https://pkg.jenkins.io/debian-stable binary/
   
Apt Update:
  module.run:
  - name: pkg.refresh_db




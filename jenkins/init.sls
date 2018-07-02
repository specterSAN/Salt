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

Installing packages:
  pkg.installed:
  - pkgs:
    - default-jre
    - default-jdk
    - jenkins
    - maven
    - git

mavenenv.sh:
  file.managed:
    - source: salt://jenkins/files/mavenenv.sh
    - name: /etc/profile.d/mavenenv.sh 
    - user: vagrant
    - group: vagrant
    - mode: 0777

jenkins file:
  file.managed:
    - source: salt://jenkins/files/jenkins
    - name: /etc/default/jenkins 
    - user: jenkins
    - group: jenkins
    - mode: 0666

groovy DIR:
  file.directory:
    - dir_mode: 755 
    - name: /var/lib/jenkins/init.groovy.d/ 
    - user: jenkins
    - group: jenkins

groovy file:
  file.managed:
    - source: salt://jenkins/files/basic-security.groovy
    - mode: 0777
    - name: /var/lib/jenkins/init.groovy.d/basic-security.groovy 
    - user: jenkins
    - group: jenkins

installing-plugins:
  cmd.script:
    - source: salt://jenkins/files/script.sh
    - cwd: /
    - user: root
    - template: jinja

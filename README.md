# **ez-portainer-install**
this lets you install portainer, docker, and docker compose, alongside all of the required dependencies in one line

## HOW DOES IT WORK?
- while installing it asks you questions and tells you anything important
- it installs (and it automatically makes it so that you dont have to type sudo whenever you run a docker command)

## WARNING
- please restart or log out and back in so that docker can be ran without sudo
- make sure you are on an up to date debian system (idk if this works on another enviroment)

---
## **INSTALL SCRIPT**
```
wget https://raw.githubusercontent.com/silverace71/docker-and-docker-compose/main/install-all-docker.sh && sudo chmod +x install-all-docker.sh && sudo ./install-all-docker.sh
```
---
### ***CREDIT***
- silverace_71 (me) - writing code (this is my first script)
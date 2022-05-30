#check for sudo privs
import os, subprocess
from getpass import getpass

def is_root():
    return os.geteuid() == 0

def test_sudo(pwd=""):
    args = "sudo -S echo OK".split()
    kwargs = dict(stdout=subprocess.PIPE,
                  encoding="ascii")
    if pwd:
        kwargs.update(input=pwd)
    cmd = subprocess.run(args, **kwargs)
    return ("OK" in cmd.stdout)

def prompt_sudo():
    ok = is_root() or test_sudo()
    return ok


#install docker
import subprocess
subprocess.run(["bash","-c","sudo curl -fsSL https://get.docker.com -o get-docker.sh"])
subprocess.run(["bash","-c","sudo sh get-docker.sh"])
subprocess.run(["bash","-c","sudo usermod -aG docker ${USER}"])
subprocess.run(["bash","-c","sudo su - ${USER}"])
#test docker and display version
subprocess.run(["bash","-c","docker version"])
#install docker compose dependencies
subprocess.run(["bash","-c","sudo apt-get install libffi-dev libssl-dev && sudo apt install python3-dev && sudo apt-get install -y python3 python3-pip"])
subprocess.run(["bash","-c","sudo pip3 install docker-compose"])
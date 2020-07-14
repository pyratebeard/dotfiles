#!/usr/bin/env python
from subprocess import check_output

def get_pass(account):
    return check_output("pass email/" + account + "/passwd", shell=True).splitlines()[0]

def get_imap(account):
    return check_output("pass email/" + account + "/imap_url", shell=True).splitlines()[0]

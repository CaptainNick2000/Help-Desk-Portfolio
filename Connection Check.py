# Choose ping or tracert, then test a host.

import subprocess
import sys
import ipaddress
import re

def is_valid_host(host):
    # IPv4 or IPv6
    try:
        ipaddress.ip_address(host)
        return True
    except ValueError:
        pass
    # Basic hostname (letters, numbers, dots, hyphens)
    if re.match(r"^[a-zA-Z0-9.-]+$", host) and len(host) > 0:
        return True
    return False

def run(cmd):
    process = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
    for line in process.stdout:
        print(line, end="")
    process.wait()

def ping(host):
    flag = "-n" if sys.platform == "win32" else "-c"
    run(["ping", flag, "4", host])

def tracert(host):
    cmd = "tracert" if sys.platform == "win32" else "traceroute"
    run([cmd, host])

if __name__ == "__main__":
    print("1) Ping")
    print("2) Tracert")
    choice = input("Choice: ").strip()

    while True:
        host = input("Host or IP: ").strip()
        if is_valid_host(host):
            break
        print("Not a valid IPv4, IPv6, or hostname. Try again.")

    if choice == "1":
        ping(host)
    elif choice == "2":
        tracert(host)
    else:
        print("Pick 1 or 2")
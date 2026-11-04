# Checks If A Windows Service Is Running Or Stopped.

import subprocess
import sys

def service_status(name):
    if sys.platform != "win32":
        print("This One Is For Windows.")
        return
    result = subprocess.run(
        ["sc", "query", name],
        capture_output=True,
        text=True
    )
    if "RUNNING" in result.stdout:
        print(f"{name} Is Running")
    elif "STOPPED" in result.stdout:
        print(f"{name} Is Stopped")
    else:
        print(f"Could Not Find Service: {name}")
        print(result.stdout)

if __name__ == "__main__":
    services = {
        "1": "Spooler",
        "2": "Dhcp",
        "3": "Dnscache",
        "4": "WinDefend",
        "5": "wuauserv",
        "6": "LanmanWorkstation",
        "7": "TermService",
        "8": "W32Time",
    }

    print("Select A Service:")
    for key, name in services.items():
        print(f"{key}) {name}")

    while True:
        choice = input("Choice: ").strip()
        name = services.get(choice)
        if name:
            service_status(name)
            break
        else:
            print("Select A Service:")
            for key, name in services.items():
                print(f"{key}) {name}")
            print("Pick A Number From The List.")
#!/usr/bin/bash/env python3
# ===============================================================================================
# Group Name: Coding-lab_Group23
# File Name: heart_rate_monitor.py
# Author(s): Seruvumba Orion, Innocente Mutabazi, Asaph Rukundo, Kelly Sangwe, Magnificat Umutesi
# Date: 2026-02-02
# Description:
# This script simulates heart rate monitor devices
# by generating random heart rate values and
# logging them continuously to a log file.
#=================================================================================================
import random
import time
import sys
import os
from datetime import datetime

# Directory and file configuration
LOG_DIR = "hospital_data/active_logs"
LOG_FILE = os.path.join(LOG_DIR, "heart_rate.log")
PID_FILE = "/tmp/heart_rate_monitor.pid"
DEVICES = ["HeartRate_Monitor_A", "HeartRate_Monitor_B"]

def ensure_log_dir():
    if not os.path.exists(LOG_DIR):
        os.makedirs(LOG_DIR)

def log_data():
    ensure_log_dir()
    while True:
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        for device in DEVICES:
            heart_rate = random.randint(60, 100)
            with open(LOG_FILE, "a") as f:
                f.write(f"{timestamp} {device} {heart_rate}\n")
        time.sleep(1)

def start():
    if os.path.exists(PID_FILE):
        print("Error: Monitor already running.")
        sys.exist(1)
    pid = os.fork()
    if pid > 0:
        with open(PID_FILE, "w") as f:
            f.write(str(pid))
        print(f"Started. PID: {pid}")
    else:
        log_data()

def stop():
    if os.path.exists(PID_FILE):
        with open(PID_FILE, "r") as f:
            pid = int(f.read().strip())
            if not pid.isdigit():
                print("Error: Invalid PID file.")
                sys.exit(1)
        os.kill(int(pid), 9)
        os.remove(PID_FILE)
        print("Stopped.")
    else:
        print("No running process found.")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 heart_rate_monitor.py [start|stop]")
        sys.exit(1)
        
    command = sys.argv[1].lower()
    
    if command == "start":
        start()
    elif command == "stop":
        stop()
    else:
        print("Invalid command. Use 'start' or 'stop'.")


#!/usr/bin/env python3

import subprocess
import re

def get_sensor_data():
    # Run the sensors command and capture its output
    output = subprocess.check_output(['sensors'], universal_newlines=True)

    # Find lines with temperature readings using regular expressions
    temp_readings = re.findall(r'^(.*):\s+\+(\d+\.\d+)°C', output, re.MULTILINE)

    return temp_readings

def format_prometheus(temp_readings):
    # Prometheus format for temperature readings
    for label, value in temp_readings:
        # Replace spaces with underscores in sensor names
        label = label.replace(' ', '_').lower()
        print(f'sensor_temperature_celsius{{sensor="{label}"}} {value}')

if __name__ == '__main__':
    temp_readings = get_sensor_data()
    format_prometheus(temp_readings)

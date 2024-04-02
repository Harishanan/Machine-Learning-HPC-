#!/usr/bin/env python3

from http.server import BaseHTTPRequestHandler, HTTPServer
import subprocess

class SensorHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        # Run the sensor exporter script and get its output
        output = subprocess.check_output(['./sensor_exporter.py'], universal_newlines=True)

        self.send_response(200)
        self.send_header('Content-type', 'text/plain; version=0.0.4; charset=utf-8')
        self.end_headers()
        self.wfile.write(output.encode())

if __name__ == '__main__':
    server_address = ('', 8000)  # Listen on all interfaces, port 8000
    httpd = HTTPServer(server_address, SensorHandler)
    print("Sensor Exporter Serving at port 8000")
    httpd.serve_forever()

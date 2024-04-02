# Monitoring Energy Consumption and Efficiency

## 1. Setting Up lm_sensors

1. First, Install lm_sensors. For Ubuntu, execute:

```sh
sudo apt-get install lm-sensors
```
2. Configuration: Run the following command to detect and configure hardware sensors.
```sh
sudo sensors-detect
```

3. Usage: Use sensors command to check the available readings. Doing <b>sensors</b> command will display:

   ![image](https://github.com/TeachingMaterial/ace-2023_-team-0/assets/85470428/37334045-44fe-4b86-aa73-a684aaa88ca9)

## 2. Integrating with Prometheus

To integrate hardware sensor data from tools like lm_sensors, with Prometheus for monitoring, a file is created which will translate data into a format Prometheus can scrape. Since Prometheus works by pulling metrics from HTTP endpoints, the goal is to expose the sensor data as HTTP endpoints.

### 2.1. Script to Expose lm_sensors Data

A script is written that outputs the sensor data in a Prometheus-friendly format ([See File Here]()). 

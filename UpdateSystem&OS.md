0 2 * * * apt-get update && apt-get upgrade -y >> /var/log/apt_upgrade.log 2>&1

    >> /var/log/apt_upgrade.log directs the output to /var/log/apt_upgrade.log. You can specify a different path if you prefer.
    2>&1 ensures that both stdout and stderr from the commands are redirected to the log file.

## Implement a system to update software and the operating system using cron and Git

## Setting Up Git for Configuration Management
In the current system configuration, all essential configuration files and custom scripts are meticulously version-controlled using Git. This strategic approach facilitates efficient tracking of modifications, seamless reversion to previous iterations when necessary, and the straightforward deployment of configurations across multiple nodes.

Within the system, these critical configuration files are stored in a directory named configurationFiles. Presently, this repository encompasses fundamental configuration files, including but not limited to, the SLURM configuration file, Prometheus configuration file, along with bash scripts designated for the installation and removal of packages, and for toggling the operational state of compute nodes. It is anticipated that subsequent versions of the High-Performance Computing (HPC) release will witness the inclusion of additional configuration files. A noteworthy feature of the current system setup is the automatic synchronization of files within the configurationFiles directory to their respective primary locations upon modification. For example, any alteration to the slurm.conf file within the configurationFiles folder is instantaneously reflected in its counterpart located at /etc/slurm/slurm.conf, owing to the establishment of a symbolic link (symlink) between these entities.

For the creation of such a symbolic link, the foundational command utilized is as follows:
```sh
ln -s /path/to/source/file /path/to/destination/file
```

This command engenders a symbolic link at the destination path that directs to the source file. Consequently, modifications made to the source file are automatically propagated to the destination through this link.


0 2 * * * apt-get update && apt-get upgrade -y >> /var/log/apt_upgrade.log 2>&1

    >> /var/log/apt_upgrade.log directs the output to /var/log/apt_upgrade.log. You can specify a different path if you prefer.
    2>&1 ensures that both stdout and stderr from the commands are redirected to the log file.

## Implement a system to update software and the operating system using cron and Git

### 1. Setting Up Git for Configuration Management
In the current system configuration, all essential configuration files and custom scripts are meticulously version-controlled using Git. This strategic approach facilitates efficient tracking of modifications, seamless reversion to previous iterations when necessary, and the straightforward deployment of configurations across multiple nodes.

Within the system, these critical configuration files are stored in a directory named configurationFiles. Presently, this repository encompasses fundamental configuration files, including but not limited to, the SLURM configuration file, Prometheus configuration file, along with bash scripts designated for the installation and removal of packages, and for toggling the operational state of compute nodes. It is anticipated that subsequent versions of the High-Performance Computing (HPC) release will witness the inclusion of additional configuration files. A noteworthy feature of the current system setup is the automatic synchronization of files within the configurationFiles directory to their respective primary locations upon modification. For example, any alteration to the slurm.conf file within the configurationFiles folder is instantaneously reflected in its counterpart located at /etc/slurm/slurm.conf, owing to the establishment of a symbolic link (symlink) between these entities.

For the creation of such a symbolic link, the foundational command utilized is as follows:
```sh
ln -s /path/to/source/file /path/to/destination/file
```

This command engenders a symbolic link at the destination path that directs to the source file. Consequently, modifications made to the source file are automatically propagated to the destination through this link.

### 2. Automating Software Updates with Cron
Cron is a time-based job scheduler in Unix-like operating systems. This can be used to schedule jobs to run periodically at fixed times, dates, or intervals.
 - <b>Open the Crontab File:</b>
   Use crontab -e to open the crontab file for editing.

- <b>Schedule Update Jobs:</b>
  Add the below commands to update the list of available packages and installs the latest versions(The system will update at 3 AM every day)
```sh
0 3 * * * apt-get update && apt-get upgrade -y >> home/master/logFiles/apt_upgrade.log 2>&1
```
Here,
- >> home/master/logFiles/apt_upgrade.log directs the output to home/master/logFiles/apt_upgrade.log 
- >> 2>&1 ensures that both stdout and stderr from the commands are redirected to the log file.

### 3. Automating Configuration Updates with Cron and Git
To ensure system configuration files are up-to-date, a cron job is scheduled to pull changes from Git repository.

- <b>Cron Job for Git Pull:</b>
  Below a cron job is added that navigates to your configuration directory and executes a git pull to fetch and merge changes from the remote repository. For example, to check for changes every day at 4 AM:

```sh
0 4 * * * cd /home/master/GitHub/ace-2023_-team-0/ && git pull >> home/master/logFiles/git_pull.log 2>&1
```

All the configuration files can be found [here](https://github.com/TeachingMaterial/ace-2023_-team-0/tree/main/configurationFiles)

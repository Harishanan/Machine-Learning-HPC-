# HPC Guide Man Page Installation

This file outlines the steps to build and install the man page for managing HPC compute nodes and running applications in an HPC environment.


## Prerequisites
The groff package installed for viewing man pages (usually pre-installed on most Linux distributions).


### Step 1: Creating the Man Page
- Start by creating a file named HPC_GUIDE.1 with the below content (This file contains the man page source code written in the troff markup language, which is used for formatting man page):

```sh   

.TH HPC_GUIDE 1 "30 March 2024"
.SH NAME
hpc_guide \- guide for managing HPC compute nodes and running applications
.SH SYNOPSIS

.B wakeup.sh
.RB [ \-on ]
.RB [ \-off ]
.br
.B sudo apptainer build
.I imagename.squashfs allApplicationPackages.def
.br
.B sudo sbatch/srun
.I slurm.script
.SH DESCRIPTION
The HPC guide outlines the procedures for turning compute nodes on or off, creating Apptainer images, and running applications within the HPC environment.
.SH "TURNING COMPUTE NODES ON/OFF"
To turn compute nodes on, use:
.nf
\fB./wakeup.sh -on\fP
.fi
To turn compute nodes off, use:
.nf
\fB./wakeup.sh -off\fP
.fi
.SH "CREATING APPTAINER IMAGE"
To create an Apptainer image, run:
.nf
\fBsudo apptainer build imagename.squashfs allApplicationPackages.def\fP
.fi
.SH "SINGULARITY.DEF FILE"
A typical allApplicationPackages.def file can be seen:
.nf
~/ExampleFile/allApplicationPackages.def
.fi
.SH "COPYING IMAGE TO NFS FOLDER"
After creating the image, it should be copied to the NFS folder.
scp imagename.def /nfs
.SH "RUNNING JOBS"
Before running sbatch or srun commands for resource allocation, create a slurm script file. A typical slurm script file can be seen:
.nf
~/ExampleFile/slurmScriptFile.slurm
.fi

.SH "MONITORING"
For monitoring the system, visit:
.nf
\fIlocalhost:3000\fP
.fi
.SH AUTHOR
Written by the TEAM-0.

```

## Step 2: Installing the Man Page

1. Copy the Man Page to the Man Directory
2. Man pages are stored in a directory structure under /usr/share/man or /usr/local/share/man. Copy man page to the appropriate section.

```sh 
sudo cp HPC_GUIDE.1 /usr/local/share/man/man1/
```
3. Update the man database to include your new man page by running:

```sh
    sudo mandb
```
The above command will display

![Output of the Man Page](https://github.com/TeachingMaterial/ace-2023_-team-0/blob/documentation/Create-Man-Page-for-HPC---Taufique/CreateManPage/Screenshot%20from%202024-03-30%2001-08-20.png)

## Step 3: Viewing the Man Page
To view the man page, use the man command followed by the name of the man page without the section number:

```sh
man HPC_GUIDE
```
The above command will display the below:

## Additional Information

### File Locations: 
The example file paths given in the man page (~/ExampleFile/allApplicationPackages.def and ~/ExampleFile/slurmScriptFile.slurm) should be replaced with actual paths where these files can be found.

### Example file can be seen here:
- [allApplicationPackages.def](https://github.com/TeachingMaterial/ace-2023_-team-0/blob/documentation/Create-Man-Page-for-HPC---Taufique/CreateManPage/ExampleFiles/allApplicationPackages.def)
- [slurmScriptFile.slurm](https://github.com/TeachingMaterial/ace-2023_-team-0/blob/documentation/Create-Man-Page-for-HPC---Taufique/CreateManPage/ExampleFiles/slurmScriptFile.slurm)

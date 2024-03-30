.TH HPC_GUIDE 1 "30 March 2024"
.SH NAME
hpc_guide \- guide for managing HPC compute nodes and running applications
.SH SYNOPSIS
.B ./wakeup.sh
.RB [ \-on ]
.RB [ \-off ]
.br
.B ./packageManager.sh
.RB [ \-i]
.RB [ \-u ]
.RB [ \-Package Name ]
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
.SH "INSTALLING AND UNINSTALLING PACKAGES ACROSS ALL NODES"
To install package, use:
.nf
\fB./packageManager.sh -i [Package Name]\fP
.fi
To uninstall package, use:
.nf
\fB./packageManager.sh -u [Package Name]\fP
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

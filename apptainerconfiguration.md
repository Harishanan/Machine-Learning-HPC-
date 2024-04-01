# How Apptainers Function with Images & How They Can be Configured:

## How How Apptainer Works with Images

Apptainer uses a container format called SIF (Singularity Image Format) for its container images. These images encapsulate the entire environment needed to run an application, including the operating system, software, libraries, and environment variables. Here's how it works:

1. Image Creation: Users create a container image based on a definition file (e.g., Singularity.def) that specifies the base environment, software to install, and any customizations.
2. Image Storage: The resulting image (e.g., imagename.squashfs) is a single file that can be easily copied and shared across different systems.
3. Image Execution: Apptainer containers run as single processes on the host system, without needing to emulate an entire operating system, leading to efficient performance on HPC systems.

Containerization ensures that none of these stages depend on an OS kernel. Therefore, containers do not carry any Guest OS with them the way a VM must. Moreover, containerized applications are tied to all their dependencies as a single deployable unit. Leveraging the features and capabilities of the host OS, containers enable these software apps to work in all environments (Meir, 2021).

## Apptainer Containers For HPC

Apptainer (Formerly known as Singularity) was designed so that applications which run in a container have the same distance to the host kernel and hardware as natively running applications as shown below. This translates to performance, jitter reduction, and the ability to directly utilize GPUs and communications fabrics such as InfiniBand and Intel Omni-Path Architecture (Intel OPA).

![771621a160b7e5c7b5c2d5dd68466a4b](https://github.com/TeachingMaterial/ace-2023_-team-0/assets/85470428/bd4b0d82-af71-426b-8f20-7da5bafdbf03)

Unlike Docker (currently the most well-known enterprise container system) and other container systems, Singularity preserves the security of the host HPC system and does not represent a breach of security. Plus Singularity includes MPI – an essential part of HPC computing.


Meir, A. (2021). What are Containers and How Do They Work? [online] Ridge Cloud. Available at: https://www.ridge.co/blog/what-are-containers/. 

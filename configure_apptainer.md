# How Apptainers Function & How they can be Configured:

## How Container Works? 

Containers work by packaging an application along with all the parts it needs—such as libraries and other dependencies—into one package. This container communicates with the Linux kernel, which is the core part of the operating system, but the application inside the container thinks it's in its own little world with its own resources. It's like giving your application its own lightweight, portable house that can be easily moved and replicated anywhere that speaks its language (runs a container engine), without having to worry about the local settings or other applications.

![Crunchtools-Blog](https://github.com/TeachingMaterial/ace-2023_-team-0/assets/85470428/3637b9fa-256f-49d5-b67a-c24cdae02399)

## How Apptainer Works

Apptainer uses a container format called SIF (Singularity Image Format) for its container images. These images encapsulate the entire environment needed to run an application, including the operating system, software, libraries, and environment variables. Here's how it works:

1. Image Creation: Users create a container image based on a definition file (e.g., Singularity.def) that specifies the base environment, software to install, and any customizations.
2. Image Storage: The resulting image (e.g., imagename.squashfs) is a single file that can be easily copied and shared across different systems.
3. Image Execution: Apptainer containers run as single processes on the host system, without needing to emulate an entire operating system, leading to efficient performance on HPC systems.

Containerization ensures that none of these stages depend on an OS kernel. Therefore, containers do not carry any Guest OS with them the way a VM must. Moreover, containerized applications are tied to all their dependencies as a single deployable unit. Leveraging the features and capabilities of the host OS, containers enable these software apps to work in all environments (Meir, 2021).

## Why Use Conatainer for HPC Purposes?

- <b>Environment Consistency:</b>
  Containers encapsulate the application and its environment. This ensures that the software runs consistently across different computing environments, which is crucial in HPC where calculations and simulations need to be reliable and reproducible.

- <b>Portability:</b>
  HPC applications often need to run on different systems, from a local cluster to large-scale cloud environments. Containers make it easy to move applications between these environments without the need for reconfiguration.

- <b>Dependency Management:</b>
  HPC applications can have complex dependencies. Containers bundle these dependencies together with the application, eliminating the "it works on my machine" problem.

- <b>Resource Efficiency:</b>
  Containers share the host OS kernel and are more lightweight than virtual machines. This allows for more efficient use of system resources, which is very important in HPC where resource optimization is critical.

- <b>Rapid Development and Deployment:</b>
  Containers support agile development and deployment practices, allowing for faster iteration on HPC applications. This can be a significant advantage in research and development settings where time to results is important.

- <b>Isolation:</b>
  Containers can help mitigate the "noisy neighbor" problem in HPC environments where multiple jobs are running on the same physical resources. By isolating the applications, containers can ensure that each job has access to the resources it needs without interference.

- <b>Scalability:</b>
  Containers can be quickly spun up and down, which is beneficial for HPC workloads that may need to scale out to many nodes during peak times and scale back down when the demand decreases.

## Apptainer Containers For HPC

Apptainer (Formerly known as Singularity) was designed so that applications which run in a container have the same distance to the host kernel and hardware as natively running applications as shown below. This translates to performance, jitter reduction, and the ability to directly utilize GPUs and communications fabrics such as InfiniBand and Intel Omni-Path Architecture (Intel OPA).

![771621a160b7e5c7b5c2d5dd68466a4b](https://github.com/TeachingMaterial/ace-2023_-team-0/assets/85470428/bd4b0d82-af71-426b-8f20-7da5bafdbf03)

Unlike Docker (currently the most well-known enterprise container system) and other container systems, Singularity preserves the security of the host HPC system and does not represent a breach of security. Plus Singularity includes MPI – an essential part of HPC computing.


## Installing Apptainer

### Install System Dependencies

On Ubuntu:

```sh
# Ensure repositories are up-to-date
sudo apt-get update
# Install debian packages for dependencies
sudo apt-get install -y \
    build-essential \
    libseccomp-dev \
    pkg-config \
    uidmap \
    squashfs-tools \
    fakeroot \
    cryptsetup \
    tzdata \
    curl wget git
```

### Install Go
Apptainer is written in Go and the latest version of GO can be downloaded from [official binaries](https://golang.org/dl/) or you can download GO via terminal by doing:

```sh
export GOVERSION={VERSION} OS=linux ARCH=amd64

wget -O /tmp/go${GOVERSION}.${OS}-${ARCH}.tar.gz \
  https://dl.google.com/go/go${GOVERSION}.${OS}-${ARCH}.tar.gz ```
```
Then,

```sh
sudo tar -C /usr/local -xzf /tmp/go${GOVERSION}.${OS}-${ARCH}.tar.gz
```
The above line extracts the downloaded tar.gz file to /usr/local using tar. The options used are:

- <b>C /usr/local:</b> </br> Changes the directory to /usr/local before extracting, effectively extracting the files into /usr/local.
- <b>xzf</b>:
  - x tells tar to extract files from an archive.
  - z tells tar to decompress the archive using gzip (since the file is a .tar.gz).
  - f specifies that the following argument is the filename of the archive to extract.

Finally, add `/usr/local/go/bin` to the `PATH` environment variable:

```sh
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc
```

### Clone the repo

```sh
git clone https://github.com/apptainer/apptainer.git
cd apptainer
```

### Compiling Apptainer

Configure, build, and install Apptainer using the following commands:

```sh
./mconfig
cd $(/bin/pwd)/builddir
make
sudo make install
```

By doing the above commands, apptainer is installed. Check by doing: 

```sh
apptainer --version
```

## References

1. Meir, A. (2021). What are Containers and How Do They Work? [online] Ridge Cloud. Available at: https://www.ridge.co/blog/what-are-containers/.
2. https://apptainer.org/docs/admin/main/installation.html
3. https://www.linuxjournal.com/content/everything-you-need-know-about-linux-containers-part-ii-working-linux-containers-lxc
4. https://crunchtools.com/comparison-linux-container-images/
5. https://apptainer.org/docs/user/main/introduction.html

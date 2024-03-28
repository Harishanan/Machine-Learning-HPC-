# What is apptainer? 

Apptainer is a container platform. It allows you to create and run containers that package up pieces of software in a way that is portable and reproducible. You can build a container using Apptainer on your laptop, and then run it on many of the largest HPC clusters in the world, local university or company clusters, a single server, in the cloud, or on a workstation down the hall. Your container is a single file, and you don’t have to worry about how to install all the software you need on each different operating system.

# Why use Apptainer?

Apptainer was created to run complex applications on HPC clusters in a simple, portable, and reproducible way. First developed at Lawrence Berkeley National Laboratory, it quickly became popular at other HPC sites, academic sites, and beyond.

# How Container Works? 

Containers work by packaging an application along with all the parts it needs—such as libraries and other dependencies—into one package. This container communicates with the Linux kernel, which is the core part of the operating system, but the application inside the container thinks it's in its own little world with its own resources. It's like giving your application its own lightweight, portable house that can be easily moved and replicated anywhere that speaks its language (runs a container engine), without having to worry about the local settings or other applications.

![Crunchtools-Blog](https://github.com/TeachingMaterial/ace-2023_-team-0/assets/85470428/3637b9fa-256f-49d5-b67a-c24cdae02399)


# Why Use Conatainer for HPC Purposes?

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

# Installing Apptainer

## Install System Dependencies

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

## Install Go
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

## Clone the repo

```sh
git clone https://github.com/apptainer/apptainer.git
cd apptainer
```

## Compiling Apptainer

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

https://apptainer.org/docs/admin/main/installation.html
https://www.linuxjournal.com/content/everything-you-need-know-about-linux-containers-part-ii-working-linux-containers-lxc
https://crunchtools.com/comparison-linux-container-images/
https://apptainer.org/docs/user/main/introduction.html

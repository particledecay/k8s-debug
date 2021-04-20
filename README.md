<p align="center">
  <h1 align="center">k8s-debug</h1>
  <p align="center">A utility container image with network, system, database, and performance tools.</p>
  <p align="center">
    <a href="https://github.com/particledecay/k8s-debug/releases/latest"><img alt="Release" src="https://img.shields.io/github/v/release/particledecay/k8s-debug"></a>
    <a href="https://hub.docker.com/r/particledecay/k8s-debug"><img src="https://img.shields.io/docker/build/particledecay/k8s-debug" /></a>
  </p>
</p>

## Description

k8s-debug is a container image meant for troubleshooting and debugging Kubernetes environments. Includes a full set of useful packages (examples below):

| Network  | System          | Database          | Performance |
| :------- | :-------------- | :---------------- | :---------- |
| dnsutils | build-essential | mongo-tools       | iperf       |
| iptraf   | coreutils       | mysql-client      | netperf     |
| netcat   | htop            | postgresql-client | siege       |
| nmap     | lsof            | redis-tools       |             |
| tcpdump  | htop (sar)      | sqlite3           |             |
| tshark   | sysstat (sar)   |                   |             |

... and many more!

## ASDF

The image also includes the wonderful [ASDF](https://asdf-vm.com) project.
The project allows you to add executables for many tools on the fly, and immediately have those executables available in your `$PATH`.
You can also install multiple versions of a tool at once.
See the [ASDF Examples](#examples) section for some inspiration.

The full list of ASDF plugins can be found [here](https://asdf-vm.com/#/plugins-all?id=plugin-list).

## Usage

This image includes Bash, ZSH, and Fish, as well as some basic configs. In order to use a shell, simply provide it as an argument so it overrides the `CMD` parameter.

### As a Docker container

```bash
docker run -it particledecay/k8s-debug fish
```

### As a standalone Kubernetes Pod

```bash
kubectl run -it k8s-debug --image=particledecay/k8s-debug:latest --restart=Never
```

### As a debugging container within another Kubernetes Pod

```bash
kubectl debug -it k8s-debug --image=particledecay/k8s-debug:latest --target=my-specific-pod
```

## Contributing

See [CONTRIBUTING](CONTRIBUTING.md).

## ASDF Examples

### Install Terraform

```bash
asdf plugin-add terraform
asdf install terraform 0.15.0
asdf global terraform 0.15.0
```

### Install kconf to manage multiple kubeconfigs

```bash
asdf plugin-add kconf
asdf install kconf latest
asdf global kconf 1.10.1
```

### View installable versions of Apache Jmeter versions (performance tool)

```bash
asdf plugin-add jmeter
asdf list-all jmeter
```

### Install kubectl for a Kubernetes 1.17 cluster

```bash
asdf plugin-add kubectl
asdf install kubectl 1.17.17
asdf global kubectl 1.17.17
```

### Download your own dotfiles with YADM

```bash
asdf plugin-add yadm
asdf install yadm latest
asdf global yadm 3.1.0
```

### Install k9s for easy Kubernetes management

```bash
asdf plugin-add k9s
asdf install k9s latest
asdf global k9s 0.24.7
```

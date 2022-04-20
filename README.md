# kube-profiles

This is simple shell script to help us switch kubectl contexts quickly. I avoid use commandline `kubectl` to get information. I use some simple command `cat`, `grep` to search needed information. It will be faster.

## Installation

You may need to check if directory `/usr/local/bin/` exist in your environment `$PATH`.

```
$ git clone https://github.com/cuongquach/kube-profiles.git
$ chmod +x kube-profiles.sh
$ mv kube-profiles.sh /usr/local/bin/kube-profiles
```

## Usage

```
$ kube-profiles
List of kubectl contexts in your local:

     1	docker-desktop
     2	gke-cuongquach-gitlab
     3	gke-cuongquach-preprod
     4	gke-cuongquach-prod
     5	gke-cuongquach-stg

Which kubectl contexts that you want to use [number] ?
Number: 5

Switched to context "gke-cuongquach-stg".
Your current kubectl context now: gke-cuongquach-stg
```

## Visit

Website : https://cuongquach.com/

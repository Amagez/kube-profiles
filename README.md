# kube-profiles

This is simple shell script to help us switch kubectl contexts quickly. I avoid using cli `kubectl` to get information. I use some simple command `cat`, `grep` to search needed information. It should be faster.

Default file kubectl profile contexts will be at: `$HOME/.kube/config`.

## Installation

You may need to check if directory `/usr/local/bin/` exist in your environment `$PATH`.

```
$ git clone https://github.com/Amagez/kube-profiles.git
$ cd kube-profiles
$ chmod +x kube-profiles.sh
$ mv kube-profiles.sh /usr/local/bin/kube-profiles
```

## Usage

```
$ kube-profiles
List of kubectl contexts in your local:

     1	docker-desktop
     2	gke-amagez-gitlab
     3	gke-amagez-preprod
     4	gke-amagez-prod
     5	gke-amagez-stg

Which kubectl contexts that you want to use [number] ?
Number: 5

Switched to context "gke-amagez-stg".
Your current kubectl context now: gke-amagez-stg
```

## Visit

Website : https://blog.amagez.com/

# Docker.HandBrakeCLI-Python3
HandBrakeCLI + Python3 in a Docker

![docker build status](https://img.shields.io/docker/build/lovebootcaptain/handbrakecli-python3.svg?style=flat-square)
![docker build](https://img.shields.io/docker/automated/lovebootcaptain/handbrakecli-python3.svg?style=flat-square)
![docker pulls](https://img.shields.io/docker/pulls/lovebootcaptain/handbrakecli-python3.svg?style=flat-square)
![docker stars](https://img.shields.io/docker/stars/lovebootcaptain/handbrakecli-python3.svg?style=flat-square)

## Pull

```bash
docker pull lovebootcaptain/handbrakecli-python3
```

## Build
```bash
docker build --build-arg SETLANG=de_DE.UTF-8 -t lovebootcaptain/handbrakecli-python3:latest
```
## Run
```bash
docker run
--entrypoint bash
-v /Volumes/video:/root/input
-v /Volumes/video/transcoded:/root/output
--env LC_ALL=de_DE.UTF-8
--env LANG=de_DE.UTF-8
--env LANGUAGE=de_DE:de
--env TZ=Europe/Berlin
--name handbrakecli-python3
-h docker-handbrake
lovebootcaptain/handbrakecli-python3:latest
```
## Usage of included scripts

the `scripts` folder is added to the `PATH` so you can use any of the scripts directly from your shell.

feel free to add and/or **contribute** your own.

`convert` 

- lets you convert a single file

`LoopConverter [file extension to convert]`

- uses `convert` on any file in a folder that matches the `[file extension]

**Example**

- `convert my_funny_video.mkv`
- `LoopConverter mkv /path/to/your/folder/`

### TODO

- add a watchdog for a folder with python3
- make watchdog configurable with ENV-variables for `docker run`
- make `convert` script configurable with ENV-variables for `docker run`
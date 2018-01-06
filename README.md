# Docker.HandBrakeCLI-Python3
HandBrakeCLI + Python3 in a Docker


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

`convert` 

- lets you convert a single file

`LoopConverter [file extension to convert]`

- uses `convert` on any file in a folder that matches the `[file extension]`

**Example**

- `convert my_funny_video.mkv`
- `LoopConverter mkv /path/to/your/folder/`
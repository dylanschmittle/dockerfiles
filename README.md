## Dockerfiles
These are my dockerfiles and a script that builds and tags them based on folder name and epoch and uses the default dockerfile path, repo name is optional and can be supplied as the first argument. Each Build is started on a new thread, so output may be confusing.
```
./build-all.sh
```
There is also a tool to launch images, clean docker, and fetch some tools
```
./scripts/run.sh
```
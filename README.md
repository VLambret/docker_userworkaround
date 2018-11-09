# Docker user ownership workaround

License : WTFPL

## Introduction

By default, files created in a docker container are created as root. When we use docker as a build environement, the created files are owned by root. This might be a problem when we also use those files from the host with the user account.

What we want in this situation is that created files are owned by the host user. The name is not enough, we have to ensure that `uid` and `gid` are the same.

## Solution

This dockerfile is using a script as the `ENTRYPOINT` to fix this issue.

- The script expects environment variables describing the host user (`_USER, _UID, _GID`)
- It also expects a `WORKSPACE` environment variable describing the container directory we want to share with the host user
- After every `docker run` command, the script will silently change ownership of files mounted in `WORKSPACE`

## Getting started

```
make image
make
# You should be in a dockered bash as root
echo "Hello world !" > /result/hello.txt
exit
# You're now in your host system
ls -Rl result

# The created file should be owned by your host user
```



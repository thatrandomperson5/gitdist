# GitDist
Easily distribute your CLI tools from GitHub!
### Table of contents
* [GitDist](https://github.com/thatrandomperson5/gitdist#gitdist)
  * [Supported OS](https://github.com/thatrandomperson5/gitdist#supported-os)
  * [Contributing](https://github.com/thatrandomperson5/gitdist/blob/main/CONTRIBUTING.md#contributing)
  * [Installation](https://github.com/thatrandomperson5/gitdist#installation)
     * [Automated](https://github.com/thatrandomperson5/gitdist#automated)
         * [Linux](https://github.com/thatrandomperson5/gitdist#linux)
     * [Manually](https://github.com/thatrandomperson5/gitdist#manually)
  * [Usage](https://github.com/thatrandomperson5/gitdist#usage)
  * [Usage for repo-owners](https://github.com/thatrandomperson5/gitdist#usage-for-repo-owners)
* [Warnings](https://github.com/thatrandomperson5/gitdist#warnings)
  * [WIP](https://github.com/thatrandomperson5/gitdist#wip)
## Supported OS

|Supported|Notes|
|---------|-----|
|Linux|Most versions of linux should work, although some might not. Supporting all linux versions is a low priority.|
|Windows|Only bultin code, not yet compiled|

|Will be Supported|Notes|
|-----------------|-----|
|MacOS|Highest prio|
|NixOS|Lower prio| 
## [Contributing](https://github.com/thatrandomperson5/gitdist/blob/main/CONTRIBUTING.md#contributing)
## Installation
How to install this tool!

For updating(In the futre, not right now) run this:
```
gitdist thatrandomperson5/gitdist
```
### Automated
Run the below depending on your device
#### Linux
```bash
git clone https://github.com/thatrandomperson5/gitdist.git
. ./gdist/setup.sh
```
This will install to `/user/local/gitdist`, if it cannot acess that it will install in the current dir as `/gdist`
### Manually
1. Run this command:
   ```
   git clone https://github.com/thatrandomperson5/gitdist.git
   ```
2. Then move `gitdist/dist/gitdist` from the cloned repo into `gitdist/gitdist` directory.
3. Move the `gitdist/gitdist` directory to a preferred location
4. Add these two paths to your PATH(`~` means the location that you moved the gitdist dir to): `~/gitdist/`, `~/gitdist/files`
5. Delete the cloned repo
6. Create an alias to `gdist` if you want.

## Usage
## Usage for repo-owners
# Warnings
## WIP
This project is currently **In development**

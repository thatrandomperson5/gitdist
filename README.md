# GitDist
[![Nim](https://img.shields.io/badge/Made%20with%3A-Nim-yellow?style=flat&logo=nim&logoColor=white)](https://nim-lang.org)
[![Linux](https://img.shields.io/badge/Linux-FCC624?style=flat&logo=linux&logoColor=black)](https://www.linux.org)
[![Windows](https://img.shields.io/badge/Windows-0078D6?style=flat&logo=windows&logoColor=white)](https://www.microsoft.com/windows/)

Easily distribute your CLI tools from GitHub!

### Table of contents
* [GitDist](https://github.com/thatrandomperson5/gitdist#gitdist)
  * [Supported OS](https://github.com/thatrandomperson5/gitdist#supported-os)
  * [Contributing](https://github.com/thatrandomperson5/gitdist/blob/main/CONTRIBUTING.md#contributing)
  * [Installation](https://github.com/thatrandomperson5/gitdist#installation)
     * [Automated](https://github.com/thatrandomperson5/gitdist#automated)
         * [Linux](https://github.com/thatrandomperson5/gitdist#linux)
         * [Windows](https://github.com/thatrandomperson5/gitdist#windows)
     * [Manually](https://github.com/thatrandomperson5/gitdist#manually)
  * [Usage](https://github.com/thatrandomperson5/gitdist#usage)
     * [Target](https://github.com/thatrandomperson5/gitdist#target)
  * [Usage for repo-owners](https://github.com/thatrandomperson5/gitdist#usage-for-repo-owners)
* [Warnings](https://github.com/thatrandomperson5/gitdist#warnings)
  * [WIP](https://github.com/thatrandomperson5/gitdist#wip)
* [Verified Listings](https://github.com/thatrandomperson5/gitdist#verified-listings)
## Supported OS

|Supported|Notes|
|---------|-----|
|Linux|Most versions of linux should work, although some might not. Supporting all linux versions is a low priority.|
|Windows|Support will be slow.|

|Will be Supported|Notes|
|-----------------|-----|
|MacOS|Highest prio|
|NixOS|Lower prio| 
## [Contributing](https://github.com/thatrandomperson5/gitdist/blob/main/CONTRIBUTING.md#contributing)
## Installation
How to install this tool!

For updating run this:
```
gitdist thatrandomperson5/gitdist
```
### Automated
Run the below depending on your device
#### Linux
```bash
git clone https://github.com/thatrandomperson5/gitdist.git
. ./gitdist/setup.sh
```
This will install to `/user/local/gitdist`. if it cannot acess that it will install in the current dir as `/gdist`, this is unavoidable and the directory must be re-named to `/gitdist`.
#### Windows
```cmd
git clone https://github.com/thatrandomperson5/gitdist.git
gitdist/setup
```
This will install to `user/gitdist`. Execute above in a testing folder. Make sure you **don't** have file explorer open to have a higher rate of sucessful install.
The only errors you have to worry about are between `Setting up` and `Setup complete`.
### Manually
(Should work on all devices with git)
1. Run this command:
   ```
   git clone https://github.com/thatrandomperson5/gitdist.git
   ```
2. Then move `gitdist/dist/gitdist(.exe)` from the cloned repo into `gitdist/gitdist` directory. 
3. Move the `gitdist/gitdist` directory to a preferred location
4. Add these two paths to your PATH(`~` means the location that you moved the gitdist dir to): `~/gitdist/`, `~/gitdist/files`
5. Delete the cloned repo
6. Create an alias to `gdist` if you want.

## Usage
**Command**: `gitdist`

**Aliases**: `gdist` Note: Only for auto-install or if otherwise set

**Info**: `gitdist --help`
### `gitdist [<options>] <target>`
|Options|Details|Values|Default/Required|
|-|-|-|-|
|`-h`, `--help`|Brings up a help menu|Flag(True/False)|False|
|`-p=`, `--priority=`|Set what to install if both bin (`.bin`) and env exist|`bin`/`env`|`bin`|
|`-s`, `--setup`|If gitdist should run `setup.sh` or `setup.bat`|Flag(True/False)|True|
#### Target
The target in `owner/repo` format.
Example:
```
gitdist thatrandomperson5/gitdist
```
## Usage for repo-owners
Create a dist directory in your repo, then put corresponding dist files inside(Listed below)
|Extention|Usage|Type|
|-|-|-|
|`.sh`|Setup script for macos and linux|setup|
|`.bat`|Setup script for windows|setup|
|`.bin`|Bin file for linux|bin|
|`.exe`|Env file for windows|env|
|`.bin.tar`|Tar compressed bin file for linux (**UNTESTED**)|bin|
|`.tar`|Tar compressed env file for linux (**UNTESTED**)|env|
|`.*`|Anything else, Env file for linux|env|

Run the command `gitdist yourname/yourepo` to test.
# Warnings
## WIP
This project is currently **In development**
# Verified Listings
To get your tool listed it must follow the requirments below:
- [X] Any setup files delete themselves
- [X] The tool does not modify the installer
- [X] The tool does not damage the users system
- [X] The tools external files are not located in the `gitdist/files` directory
### List:
**None yet ????**

# iDSK

## Description
iDSK is a tool to edit DSK (Amstrad CPC disk images) files from the command
line. You can add and remove files from your image, but also list BASIC and
DAMS source files (which are usually in a tokenized format, not plain ASCII).

iDSK can add and remove AMSDOS headers as needed.

## Changelog
 - 2025-01-29 
    - Removed Travis CI Build Status that is not maintained
    - Added Dockerfile and compile instructions for macOS and Linux

## **Building iDSK**

### **from Source**
Before compiling iDSK, ensure you have the following installed:

#### **Linux (Ubuntu/Debian)**
```bash
sudo apt update && sudo apt install -y cmake make g++ git

# Clone the repository
git clone https://github.com/RetroHoarder/idsk.git
cd idsk

# Create a build directory
mkdir build && cd build

# Run CMake to configure the build
cmake ..

# Compile the project
cmake --build .
```

#### **macOS**
```bash
# Assuming Homebrew is installed see https://brew.sh

# May require that you install XCode first
# xcode-select --install

brew install cmake make 

git clone https://github.com/RetroHoarder/idsk.git
cd idsk

# Create a build directory
mkdir build && cd build

# Run CMake to configure the build
cmake ..

# Compile the project
cmake --build .
```

#### **Docker Image**
```bash
# Build the image
docker build -t idsk .

# To list the disk image image.dsk in your current directory, run:
docker run -it -v .:/disks idsk  -l /disks/image.dsk

# Running an Interactive Shell in the iDSK Docker Container
docker run -it -v .:/disks --entrypoint /bin/bash  idsk
root@36bea02a08f7:~# iDSK
You did not select a DSK file to work with !

--------------------------------------------------------------------------------
################################################################################
iDSK version 0.20 (by Demoniak, Sid, PulkoMandy), http://github.com/cpcsdk
################################################################################

Usage :
	iDSK <DSKfile> [OPTIONS] [files to process]
OPTIONS :                              EXAMPLE
-l : List disk catalog                 iDSK floppy.dsk -l (default option is no option is set)
-g : export ('Get') file               iDSK floppy.dsk -g myprog.bas
-r : Remove file                       iDSK floppy.dsk -r myprog.bas
-n : create New dsk file               iDSK floppy2.dsk -n
-z : disassemble a binary file         iDSK floppy.dsk -z myprog.bin
-b : list a Basic file                 iDSK floppy.dsk -b myprog.bas
-p : split lines after 80 char             ... -p
-a : list a Ascii file                 iDSK floppy.dsk -a myprog.txt
-d : list a Dams file                  iDSK floppy.dsk -d myprog.dms
-h : list a binary file as Hexadecimal iDSK floppy.dsk -h myprog.bin
-i : Import file                       iDSK floppy.dsk -i myprog.bas
 -t : fileType (0=ASCII/1=BINARY/2=raw)     ... -t 1
 -e : hex Execute address of file           ... -e C000 -t 1
 -c : hex loading address of file           ... -e C000 -c 4000 -t 1
 -f : Force overwriting if file exists      ... -f
 -o : insert a read-Only file               ... -o
 -s : insert a System file                  ... -s
 -u : insert file with User number          ... -u 3
--------------------------------------------------------------------------------
Please report bugs ! - Demoniak/Sid/PulkoMandy
root@36bea02a08f7:~#
```
# Development Guide on the RW612 
Seaver Olson 2/10/2025
- [ Starting the J-Link Probe ](#JLink)
- [ Compiling project ](#compile)
- [ Loading .elf onto board](#gdb)
- [ http server over wifi example ](#wifiExample)
- [ more resources ](#resources)

## Starting the J-Link Probe {#JLink}  
1. **Download the Correct J-Link Software**  
   - Visit the official SEGGER download page: [J-Link Software & Documentation Pack](https://www.segger.com/downloads/jlink#J-LinkSoftwareAndDocumentationPack).  
   - Select the appropriate version for your OS (Linux, macOS, or Windows).  

2. **Install the J-Link Software on Linux**  
   - If using Linux, install the `.deb` package using the Debian Package Manager:  
     ```sh
     sudo dpkg -i JLink_Linux_V812_arm64.deb
     ```

3. **Learn to use J-Link**
   - ```sh
     JLinkGDBServerExe
     ``` 
   - The command above will open the interface options panel where we will select a few settings for the rw612
   - [ ] Connection to JLink: USB
   - [ ] Target device: RW612, Little Endian
   - [ ] Target interface: SWD

## Compiling the Project {#compile}  
1. **Install Required Toolchains and Dependencies**  
   - Ensure you have the ARM GCC toolchain installed:  
     ```sh
      sudo apt install gcc-arm-none-eabi bzip2 make exuberant-ctags
     ```  
   - Install `CMake`:  
     ```sh
       sudo apt install cmake
     ```
2. **Compile Program Directory**
   - locate the desired project build file usually titled `./build_flash_debug.sh`
   - run `ARMGCC_DIR=/usr/ ./build_flash_debug.sh` this will compile your project into a directory labeled `flash_debug`
## Loading the .elf onto the board {#gdb}
1. ** load program via gdb
   - from this new directory run `gdb filename.elf` and insert the elf file that is located in that new directory
     - from the gdb terminal run `target remote localhost:2331` once you have the J-Link(#JLink) server set up in another window
     - once your gdb terminal is connected to your embedded system execute `load` to compile to `.elf` file onto the board
     - after the `load` command is complete exit gdb and proceed to [recieving data from the board](#minicom)
    

## http server over wifi example {#wifiExample}

## more resources {#resources}

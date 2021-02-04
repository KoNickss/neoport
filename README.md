# NeoPort for Linux
# ==================
## INSTALLING
To install the program, run the install executable with root privileges (`sudo ./install`) and follow the instructions.

## LICENSING INFORMATION:
This program ships under the GNU_GPL v3.0 license, the entire document may be read either in the LICENSE file in this folder or via the gnu website.

## COMPILING (optional, but reccomended)
For compilation you can either pick the c src or the bash src.
The bash src (neoport.src.bash) can be simply renamed to neoport and moved to /usr/bin/ if bash is already installed on the system.
If you want to compile the C src (neoport.src.c) simply run `g++ neoport.src.c` and move the resulting file into the filesystem.
If you want to compile the bash program into a statically compiled executable, run `shc -f neoport.src.bash`
For the sake of availability and not installing packages not specifically requested by the user, the installer installs an already compiled version, but you can always compile it yourself with the srcs in this folder.
IMPORTANT: To use the installation script with your custom executable, renamed the file you want to install to "neoport"

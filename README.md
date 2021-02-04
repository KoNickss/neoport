# NeoPort for Linux
## Installation
To install the program, run the install executable with root privileges (`sudo ./install`) and follow the instructions.

## Licensing:
This program ships under the GNU_GPL v3.0 license, the entire document may be read either in the LICENSE file in this folder or via the gnu website.

## Compilation (optional)
For compilation you can either pick the c src or the bash src.
The bash src (neoport.src.bash) can be simply renamed to neoport and moved to /usr/bin/ if bash is already installed on the system.
If you want to compile the C src (neoport.src.c) simply run `gcc neoport.src.c` and move the resulting file into the filesystem.
If you want to compile the bash program into a statically compiled executable, run `shc -f neoport.src.bash`
For the sake of availability and not installing packages not specifically requested by the user, the installer installs an already compiled version, but you can always compile it yourself with the srcs in this folder.
IMPORTANT: To use the installation script with your custom executable, renamed the file you want to install to "neoport"

## Syntax
To install an extension from github, simply run `neoport install author/repo`, author and repo can be found in the last part of the github url, support for other sites will come in later versions.

To update every single extension run `neoport update`

To install a colour theme do `neoport color install author/repo`, to change your colour theme just do `neoport color set list` to get a list and `neoport color set name.vim` to set it.

## Updating
Right now there isn't really a way other than reinstalling, but I'll implement a command for it soon.

# nvim

at long last i am moving from vi(m) to nvim!

here are my ever-evolving configs

you should just be able to move all these files to
~/.config/nvim

install instructions and pre-reqs coming

latest addition (adding harpoon), breaks install
manually open .config/nvim/lua/ProfessorSteve/plugins-setup.lua
and write.  everything should fall into place after that

MacOS
1. install brew
2. install iTerm2, neovim, ripgrep, cppcheck
3. install nerd fonts
4. add alias vi=nvim  to .bashrc
6. git clone this repo and move to .config
7. nvim  - errors will pop up but then the installers will popup.  repeat a few times till everything is installed.


Kali (and other Linux variants)
1. download https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
2. unzip and move to /opt
3. add /opt/nvim-linux64 to $PATH
4. add alias vi=nvim  to .bashrc
5. sudo apt install cmake cppcheck
6. git clone this repo and move to .config
7. logout/login
8. nvim  - errors will pop up but then the installers will popup.  repeat a few times till everything is installed.

#一键设置shell
anaconda_version=$1
anaconda_address=$2

#Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
#If you want to uninstall oh-my-zsh, just run uninstall_oh_my_zsh

#在安装完成zsh后会自动跳到oh-my-zsh，这实际上是一个子进程，其存在阻塞了父进程bash的一系列命令，故需要退出
exit

#python环境搭建
#anaconda3下载
if [ ! -d "~backup" ]; then
  mkdir ~backup
fi
cd backup
wget "https://repo.continuum.io/archive/Anaconda3-$anaconda_version-Linux-x86_64.sh"
#Anaconda 默认安装在$HOME/opt/anaconda3下
bash Anaconda3-$anaconda_version-Linux-x86_64.sh
#设置环境变量
echo "export PATH=$anaconda_address/anaconda3/bin/:$PATH"
echo "export PATHONPATH=$anaconda_address/anaconda3/lib/:$PATHONPATH"

#vim 配置
cp .vimrc $HOME/.vimrc
#安装vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#利用vundle安装相关插件
vim +PluginInstall +qall

#YouCompleteMe
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev
cd ~/.vim/bundle/YouCompleteMe
./install.py




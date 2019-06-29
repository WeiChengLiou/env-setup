sudo apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-gui-common
 
sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git

#Optional: so vim can be uninstalled again via `dpkg -r vim`
# sudo apt-get install checkinstall

sudo rm -rf /usr/local/share/vim /usr/bin/vim

cd ~
git clone https://github.com/vim/vim
cd vim
git pull && git fetch

#In case Vim was already installed
cd src
make distclean
cd ..

export LUA_PREFIX=/usr/local

# ./configure \
# --enable-multibyte \
# --enable-perlinterp=dynamic \
# --enable-rubyinterp=dynamic \
# --with-ruby-command=/usr/bin/ruby \
# --enable-pythoninterp=dynamic \
# --enable-python3interp \
# --with-python3-config-dir=/home/gilbert/anaconda3/lib/python3.6/config-3.6m-x86_64-linux-gnu \
# --enable-luainterp \
# --with-luajit \
# --enable-cscope \
# --enable-gui=auto \
# --with-features=huge \
# --with-x \
# --enable-fontset \
# --enable-largefile \
# --disable-netbeans \
# --with-compiledby=sh1r0 \
# --enable-fail-if-missing

./configure --with-features=huge \
--enable-multibyte \
--enable-rubyinterp \
--with-ruby-command=/usr/bin/ruby \
--enable-pythoninterp \
--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
--enable-python3interp \
--with-python3-config-dir=/home/gilbert/anaconda3/lib/python3.6/config-3.6m-x86_64-linux-gnu \
--enable-perlinterp \
--with-luajit \
--enable-luainterp \
--enable-cscope \
--enable-largefile \
--enable-fontset \
--prefix=/usr/local

make && sudo make install

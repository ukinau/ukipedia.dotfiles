# Create a directory
mkdir tmux-install
cd tmux-install

# Get the files
curl -OL https://github.com/tmux/tmux/releases/download/2.3/tmux-2.3.tar.gz
curl -OL https://github.com/libevent/libevent/releases/download/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz

# Extract them 
tar xzf tmux-2.3.tar.gz
tar xzf libevent-2.0.22-stable.tar.gz

# Compile libevent
cd libevent-2.0.22-stable
CPPFLAGS=-I/usr/local/opt/openssl/include ./configure --prefix=/opt
make
sudo make install

# Compile tmux
cd ../tmux-2.3
LDFLAGS="-L/opt/lib" CPPFLAGS="-I/opt/include" LIBS="-lresolv" ./configure --prefix=/opt
make
sudo make install

# Link it
ln -s /opt/bin/tmux /usr/local/bin/tmux

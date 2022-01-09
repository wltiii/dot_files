echo ===================================================================================================
echo  node-and-npm.sh
echo 
echo  based upon node-and-npm-in-30-seconds.sh at https://gist.github.com/isaacs/579814
echo 
echo  added progress echoing
echo  comment out path addition as it is already on path via .bash_exports
echo  changed npm configure prefix argument from ~ to HOME
echo  separated the curl of npm from the execution of the installation script
echo  - the curl was altered to follow redirects (according to other posts, npmjs.org should now be npmjs.com)
echo  - the curl was altered to output to a filename the same as the remote filename retrieved (install.sh)
echo
echo NOTE: You should probably delete ~/local and ~/node-latest-install when re-running
echo
echo NOTE: Append the npm root value to your NODE_PATH variable by adding the following line to 
echo       your .bashrc (it should already be part of .bash_exports):
echo 
echo       export NODE_PATH=$NODE_PATH:/home/worldwidewilly/local/lib/node_modules
echo
echo ===================================================================================================
echo 
echo ==================> modifying bashrc to add $HOME/local/bin to path
# already on path - not needed here
#echo 'export PATH=$HOME/local/bin:$PATH' >> ~/.bashrc
#. ~/.bashrc

echo ==================> making directory ~/local
mkdir ~/local

echo ==================> making directory ~/node-latest-install
mkdir ~/node-latest-install

echo ==================> changing to directory ~/node-latest-install
cd ~/node-latest-install

echo ==================> curling latest node distribution
curl http://nodejs.org/dist/node-latest.tar.gz | tar xz --strip-components=1

echo ==================> configuring
./configure --prefix=$HOME/local

echo ==================> running make
make install # ok, fine, this step probably takes more than 30 seconds...

echo ==================> curling npm install.sh
curl -O -L https://npmjs.org/install.sh

echo ==================> running npm install.sh
sh install.sh


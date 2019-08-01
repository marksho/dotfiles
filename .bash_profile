# initialize pyenv
export WORKON_HOME=~/.ve
export PROJECT_HOME=~/workspace
eval "$(pyenv init -)"
pyenv virtualenvwrapper_lazy

# initialize nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# add X11 path
export XAuthLocation=/opt/X11/bin/xauth

# add to PATH env
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/miniconda/bin:$PATH
export PATH=~/scripts:$PATH
export PATH=/Applications/MATLAB_R2019a.app/bin/:$PATH

# alias for Lua LOVE2D
alias love="/Applications/love.app/Contents/MacOS/love"

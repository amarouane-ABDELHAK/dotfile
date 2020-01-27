
if [ -z "$ZSH" ]
then
    export ZSH="/Users/amarouane/.oh-my-zsh"
    ZSH_THEME="powerlevel9k/powerlevel9k"


    plugins=(
        git
        osx
        zsh-syntax-highlighting
        zsh-autosuggestions
    )

    source $ZSH/oh-my-zsh.sh
    POWERLEVEL9K_VCS_GIT_ICON=''
    POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
    POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
    POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
    POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
    POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(anaconda custom_javascript dir vcs)

    POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
    POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
    POWERLEVEL9K_PROMPT_ON_NEWLINE=true


    
    POWERLEVEL9K_CUSTOM_JAVASCRIPT="echo $USER"
    POWERLEVEL9K_CUSTOM_JAVASCRIPT_FOREGROUND="yellow"
    POWERLEVEL9K_CUSTOM_JAVASCRIPT_BACKGROUND="black"

    POWERLEVEL9K_ANACONDA_FOREGROUND="red"
    POWERLEVEL9K_ANACONDA_BACKGROUND="black"
    prompt_anaconda() {
  # Depending on the conda version, either might be set. This
  # variant works even if both are set.

  _path=$CONDA_ENV_PATH$CONDA_PREFIX

  if [ "$CONDA_DEFAULT_ENV"  = 'base' ] ; then
       POWERLEVEL9K_ANACONDA="echo 'kk'"
  else
     if ! [ -z "$_path" ]; then
    # config - can be overwritten in users' zshrc file.
    set_default POWERLEVEL9K_ANACONDA_LEFT_DELIMITER "("
    set_default POWERLEVEL9K_ANACONDA_RIGHT_DELIMITER ")"
    "$1_prompt_segment" "$0" "$2" "$3" "$4" "$POWERLEVEL9K_ANACONDA_LEFT_DELIMITER$(basename $_path)$POWERLEVEL9K_ANACONDA_RIGHT_DELIMITER" 'PYTHON_ICON'
  fi
  fi
  
}

    array=( 
        /usr/local/opt/ruby/bin
        /usr/local/lib/ruby/gems/2.6.0/bin
        )
    for i in "${array[@]}"
        do
	        PATH=$PATH:$i
	
        done
    export PATH=$PATH
    
fi



# My custom function 
######### Custom git command ###############
function gitpush() {
    gitcommit $1
    git push origin $(git name-rev --name-only HEAD)
}

function gitignorechange() {
    git stash
    git stash clear
}

function gittrash() {
    currentBranch=$(git name-rev --name-only HEAD) 
    git checkout -b trash-$(date +%F%H%M%S)
    gitcommit "To delete"
    git checkout $currentBranch
}

function gitcommit() {
    git add .
    git commit -m $1
}

load_nvm(){
    
if [ -z "$NVM_DIR" ]
    then
    
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

}

function gitmergerequestTo() {
    currentBranch=$(git name-rev --name-only HEAD) 
    git push -u origin $currentBranch -o merge_request.create -o merge_request.target=$1
}


node() {
    unset -f node
    load_nvm
    
    node "$@"

}
npm() {
    unset -f npm
    load_nvm
    
    npm "$@"
}

nvm() {
    unset -f nvm
    load_nvm
    
    nvm "$@"
}


if [ -z "$CONDA_DEFAULT_ENV" ]
    then
    
        # >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/amarouane/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/amarouane/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/amarouane/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/amarouane/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
fi

alias tf=terraform
alias cdgitlab="cd $HOME/workstation/gitlab"
alias cdgithub="cd $HOME/workstation/github"
function loginECR {
    aws ecr get-login --no-include-email --profile $AWS_PROFILE --region $AWS_REGION
}

# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature: # export SYSTEMD_PAGER=
# User specific aliases and functions
#if [ -d ~/.bashrc.d ]; then
#    for rc in ~/.bashrc.d/*; do
#        if [ -f "$rc" ]; then
#			. "$rc"
#		fi
#	done
#fi

if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi

unset rc

# Get current branch if git is init in the directory

parse_git_branch() {
    git rev-parse --abbrev-ref HEAD 2> /dev/null
}

# Setting the PS1 variable (prompt)
export B=$(git branch --show-current 2>/dev/null)

#export PS1="\[\e[90m\]╔ \[\e[33m\]\u\[\e[90m\]@\[\e[34m\]\h\[\e[90m\]:\[\e[35m\]\W\[\e[90m\](\[\e[31m\]$(parse_git_branch)\[\e[90m\])\n\[\e[90m\]╚ \[\e[34m\]λ\[\e[0m\] "

export PS1="\[\e[32m\]\u\[\e[0m\]@\[\e[32m\]\h\[\e[90m\]:\[\e[35m\]\W\[\e[90m\]\[\e[90m\] \[\e[34m\]$\[\e[0m\] "

#eval "$(starship init bash)"

#export PATH=$HOME/Documents/projects/Research:$PATH

#Aliases
alias v="nvim"
alias e="emacs"
alias dotvim="cd ~/.config/nvim"
alias push="git push -u origin main"
alias gitit="git add . && git commit"
alias notes="cd ~/Documents/physics_notes"
alias hea="cd ~/Documents/physics_notes/he_astrophysics/assignments"
alias rustbook="rustup docs --book"
alias jn="jupyter notebook"
alias bellatrix="ssh -Y students@88.197. -p 65001"
alias virc="vi $HOME/$VIMRUNTIMEPATH"

. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

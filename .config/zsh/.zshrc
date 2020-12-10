# /etc/zsh/zshrc or ~/.zshrc
#
# .zshrc file by github.com/nikkehtine
#
# Additional packages that need to be installed: vim, git, pkgfile, zsh-syntax-highlighting
#
# NOTE: This is a user .zshrc file. DO NOT USE UNDER ROOT. It might break your directory structure and certain things might not work.

## Environment
if [ -e /etc/environment ]
then
    source /etc/environment
fi

## Custom prompt
# This prompt loads up first by default and can be used in case the other prompt is not installed
setopt promptsubst
PS1="[%F{45}%T%f] [%F{114}%n%f@%F{214}%m%f:%F{219}\$(spwd)%f]%(!.%F{1}#%f.%F{4}$%f) "

## Pure prompt
if [ -d $HOME/.zsh/pure ]
then
	fpath+=$HOME/.zsh/pure
	autoload -U promptinit; promptinit
	prompt pure
else
	echo "You might wanna install Pure Prompt by running the command:"
	echo "$ pureprompt"
fi

## Aliases

# Alias please to sudo for a much more wholesome unix experience
alias please='sudo'

# Edit .zshrc and reload it on exit
alias zshrc='vim ~/.config/zsh/.zshrc ; source ~/.config/zsh/.zshrc'
alias reload='source ~/.config/zsh/.zshrc'

# Make the commands more verbose and human readable
alias ls='ls -lAh --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias df='df -h'
alias free='free -m'

# Use vim instead of vi
alias vi='vim'

# pacman commands
alias upd='sudo pacman -Syu --noconfirm'
alias unlock='sudo rm /var/lib/pacman/db.lck'

#alias upd='sudo apt update && sudo apt upgrade' # Debian

# Git stuff
alias addall='git add .'
alias addup='git add -u'
alias branch='git branch'
alias checkout='git checkout'
alias commit='git commit -m'
alias fetch='git fetch'
alias gdiff="git diff"
alias pull='git pull origin'
alias push='git push origin'
alias status='git status'
alias tag='git tag'
alias newtag='git tag -a'

# Install the Pure Zsh Prompt
alias pureprompt='mkdir ~/.zsh ; cd ~/.zsh ; git clone https://github.com/sindresorhus/pure.git ; cd ~ ; source ~/.config/zsh/.zshrc'

## ZSH specific settings
# man zshoptions
setopt correct          # try to correct spelling of commands
setopt print_exit_value # print return value if non-zero
unsetopt beep           # no bell on error
unsetopt clobber        # must use >| to truncate existing files
unsetopt hist_beep      # no bell on error in history
unsetopt ignore_eof     # do not exit on end-of-file
unsetopt list_beep      # no bell on ambiguous completion
unsetopt rm_star_silent # ask for confirmation for `rm *' or `rm path/*'

# Completion options
# man zshoptions
setopt auto_cd            # if command is a path, cd into it
setopt auto_pushd         # make cd push old dir in dir stack
setopt auto_remove_slash  # self explanatory
setopt chase_links        # resolve symlinks
setopt extended_glob      # activate complex pattern globbing
setopt glob_dots          # include dotfiles in globbing
setopt nocaseglob         # case insensitive globbing
setopt pushd_ignore_dups  # no duplicates in dir stack
setopt pushd_silent       # no dir stack after pushd or popd
setopt pushd_to_home      # `pushd` = `pushd $HOME`
unsetopt bg_nice          # no lower prio for background jobs
unsetopt hup              # no hup signal at shell exit
unsetopt list_ambiguous   # ??

zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'
zstyle ':completion:*' max-errors 3 numeric
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*' use-compctl false
_comp_options+=(globdots)	# Include hidden files

autoload -Uz compinit
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION 

## History settings
if [ -d ~/.cache/zsh ]
then
	echo "idk what lol" >> /dev/random
else
	mkdir ~/.cache/zsh
fi
export ZSH_CACHE_DIR=~/.cache/zsh
export HISTSIZE=5000
export SAVEHIST=5000
export HISTFILE=~/.cache/zsh/zshhistory
setopt extended_history     # save timestamp and duration
setopt hist_ignore_all_dups # no duplicate
setopt hist_ignore_space    # ignore space prefixed commands
setopt hist_verify          # verify hist expansion
setopt inc_append_history   # append instead of replace
setopt share_history        # share hist between sessions

# Suggest package if command not found
source /usr/share/doc/pkgfile/command-not-found.zsh

# Some tty improvement
ttyctl -f

## Functions

# Shortened PWD
function spwd {
    paths=(${(s:/:)PWD})

    cur_path='/'
    cur_short_path='/'
    for directory in ${paths[@]}
    do
    cur_dir=''
        for (( i=0; i<${#directory}; i++ )); do
            cur_dir+="${directory:$i:1}"
            matching=("$cur_path"/"$cur_dir"*/)
            if [[ ${#matching[@]} -eq 1 ]]; then
            break
        fi
    done
    cur_short_path+="$cur_dir/"
    cur_path+="$directory/"
    done

    printf %q "${cur_short_path: : -1}"
    echo
}

## Keybindings
# Lookup in /etc/termcap or /etc/terminfo else, you can get the right keycode
# by typing ^v and then type the key or key combination you want to use.
# "man zshzle" for the list of available actions
bindkey '^A'      beginning-of-line       # Home
bindkey '^E'      end-of-line             # End
bindkey '^D'      delete-char             # Del
bindkey '\e[3~'   delete-char             # Del
bindkey '\e[2~'   overwrite-mode          # Insert
bindkey '\e[5~'   history-search-backward # PgUp
bindkey '\e[6~'   history-search-forward  # PgDn
bindkey '\e[1;5C' forward-word            # C-Right
bindkey '\e[1;5D' backward-word           # C-Left
bindkey '\e.'     insert-last-word        # Esc+. works now in screen/tmux

# Linux console, screen or rxvt.
bindkey '\e[1~' beginning-of-line       # Home
bindkey '\e[4~' end-of-line             # End

# xterm
bindkey '\e[H'  beginning-of-line       # Home
bindkey '\e[F'  end-of-line             # End
bindkey '\eOH'  beginning-of-line       # Home
bindkey '\eOF'  end-of-line             # End

## Load zsh-syntax-highlighting last
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

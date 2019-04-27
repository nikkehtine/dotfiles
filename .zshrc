# /etc/zsh/zshrc or ~/.zshrc

## Environment
if [ -e /etc/environment ]
then
    source /etc/environment
fi

## Aliases
alias ls='ls --color=auto '
alias ll='ls -l'
alias la='ls -a'
alias lL='ls -la'
alias ..="cd .."
alias upd="sudo pacman -Syu --noconfirm"

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


## ZSH specific settings
# man zshoptions
setopt correct          # try to correct spelling of commands
setopt print_exit_value # print return value if non-zero
unsetopt beep           # no bell on error
unsetopt clobber        # must use >| to truncate existing files
unsetopt hist_beep      # no bell on error in history
unsetopt ignore_eof     # do not exist on end-of-file
unsetopt list_beep      # no bell on ambiguous completion
unsetopt rm_star_silent # ask for confirmation for `rm *' or `rm path/*'

# Completion style
unsetopt list_ambiguous # ??

# Completion options
# man zshoptions
setopt auto_cd            # if command is a path, cd into it
setopt auto_pushd         # make cd push old dir in dir stack
setopt auto_remove_slash  # self explanatory
setopt chase_links        # resolve symlinks
setopt extended_glob      # activate complex pattern globbing
setopt glob_dots          # include dotfiles in globbing
setopt pushd_ignore_dups  # no duplicates in dir stack
setopt pushd_silent       # no dir stack after pushd or popd
setopt pushd_to_home      # `pushd` = `pushd $HOME`
unsetopt bg_nice          # no lower prio for background jobs
unsetopt hup              # no hup signal at shell exit

zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'
zstyle ':completion:*' max-errors 3 numeric
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*' use-compctl false

autoload -Uz compinit
compinit

## History settings
export HISTORY=10000
export HISTSIZE=10000
export SAVEHIST=8000
export HISTFILE=~/.zshhistory
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

## Custom prompt
setopt promptsubst

PS1="[%F{45}%T%f] [%F{114}%n%f@%F{214}%m%f:%F{219}\$(spwd)%f]%(!.%F{1}#%f.%F{4}$%f) "

## Exports
export LANG="en_US.UTF-8"
export LANGUAGE="en"
export LC_CTYPE="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_GB.UTF-8"
export LC_MONETARY="pl_PL.UTF-8"
export LC_NAME="pl_PL.UTF-8"
export LC_ADDRESS="pl_PL.UTF-8"
export LC_TELEPHONE="pl_PL.UTF-8"
export LC_MEASUREMENT="pl_PL.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR="vim"
export VISUAL="vim"

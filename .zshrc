# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -f "$HOME/.antigen/antigen.zsh" ]; then
  source "$HOME/.antigen/antigen.zsh"

  # Load the oh-my-zsh's library.
  antigen use oh-my-zsh

  antigen bundles <<EOBUNDLES

  # Bundles from the default repo (robbyrussell's oh-my-zsh).
    alias-finder
    common-aliases

    git
    git-extras
    git-flow
    gitignore
    github

    rsync
    python
    perl

    command-not-found
    history
    tmux
    vscode

    fzf
    vagrant
    docker
    docker-machine
    docker-compose
    debian
    osx
    brew
    brew-cask
    systemd
    z

    sudo

    zsh-users/zsh-history-substring-search

    Tarrasch/zsh-bd
    Tarrasch/zsh-functional

    rimraf/k

  # Syntax highlighting bundle.
    zsh-users/zsh-syntax-highlighting

  # Completions
    zsh-users/zsh-completions src
    bobthecow/git-flow-completion
    srijanshetty/zsh-pandoc-completion
    RobSis/zsh-completion-generator

EOBUNDLES

  # Load the theme.
  #antigen theme robbyrussell
  #antigen theme jreese
  #antigen theme agnoster

  export POWERLEVEL9K_MODE=nerdfont-complete
  export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon status command_execution_time history context dir dir_writable vcs)
  export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
  export POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
  export POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"

  # antigen bundle bhilburn/powerlevel9k
  # antigen theme bhilburn/powerlevel9k powerlevel9k
  antigen theme romkatv/powerlevel10k

# Tell antigen that you're done.

  antigen bundle massa/massazsh
  antigen apply
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

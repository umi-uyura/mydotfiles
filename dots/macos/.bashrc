# alias

alias ll='ls -AlFG'
alias la='ls -AG'
alias l='ls -CFG'

# Load my .bashrc

if [ -f "$HOME/.bashrc_basis" ]; then
  # shellcheck source=../.bashrc_basis
  . "$HOME/.bashrc_basis"
fi

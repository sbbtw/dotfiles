set -g fish_greeting ""
if status is-interactive
# Commands to run in interactive sessions can go here
end
alias vi=nvim
alias ls="eza --icons=always"
function copy_from_history
  history | fzf | xclip -selection clipboard
end
bind \ct copy_from_history

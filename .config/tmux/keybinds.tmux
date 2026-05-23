# Easier and faster switching between next/prev window
bind C-p previous-window
bind C-n next-window

# Remap prefix to C-Space
unbind C-b
set-option -g prefix C-space
bind-key C-space send-prefix

# Vimlike mouse selection
bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi V send-keys -X select-line
bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle

# Fix paste with middle mouse
unbind -T copy-mode-vi MouseDragEnd2Pane
bind -T root MouseDown2Pane run "tmux set-buffer \"$(wl-paste)\"; tmux paste-buffer"

# Yank to both tmux buffer and system clipboard
bind-key -T copy-mode-vi 'y' send-keys -X copy-pipe-and-cancel "wl-copy"

# Yank directly on double click
bind -T copy-mode-vi MouseDragEnd1Pane send -X copy-pipe-and-cancel "wl-copy"

# cheatsheet for commands
bind-key ? display-popup -w 60% -h 60% -E "cat <<'EOF' | fzf --no-sort --layout=reverse --border=rounded --header='Keybinds — type to filter, ESC to close' --prompt='' --pointer='→'
[tmux]  c          new window
[tmux]  n / p      next / prev window
[tmux]  0-9        jump to window
[tmux]  |          split horizontal
[tmux]  -          split vertical
[tmux]  h/j/k/l    navigate panes
[tmux]  H/J/K/L    resize panes
[tmux]  x          close pane
[tmux]  d          detach
[tmux]  s          list sessions
[tmux]  $          rename session
[tmux]  F          tmux-fzf
[tmux]  I          install plugins
[tmux]  [          enter copy mode
[tmux]  v          select (copy mode)
[tmux]  V          select line (copy mode)
[tmux]  C-v        select block (copy mode)
[tmux]  y / Enter  yank to clipboard (copy mode)
[tmux]  ?          this cheatsheet
[zsh]   C-r        reverse search history
[zsh]   C-s        forward search history
[zsh]   C-p        previous history entry
[zsh]   C-n        next history entry
[zsh]   C-a        beginning of line
[zsh]   C-e        end of line
[zsh]   M-b        back one word
[zsh]   M-f        forward one word
[zsh]   C-w        delete word backward
[zsh]   C-k        kill to end of line
[zsh]   C-u        kill entire line
[zsh]   C-y        yank (paste) killed text
[zsh]   C-l        clear screen
EOF"

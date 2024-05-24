# Easier and faster switching between next/prev window
bind C-p previous-window
bind C-n next-window

# Remap prefix to C-Space
unbind C-b
set-option -g prefix C-space
bind-key C-space send-prefix

# Fix paste with middle mouse
unbind -T copy-mode-vi MouseDragEnd2Pane
bind -T root MouseDown2Pane run "tmux set-buffer \"$(xclip -o -selection clipboard)\"; tmux paste-buffer"

# Yank to both tmux buffer and system clipboard
bind-key -T copy-mode-vi 'y' send-keys -X copy-pipe-and-cancel "xclip -selection clipboard -i && xclip -selection primary -i"

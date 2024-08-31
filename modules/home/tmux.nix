{
	programs.tmux = {
		enable = true;
		baseIndex = 1;
		clock24 = true;
		escapeTime = 0;
		keyMode = "vi";
		mouse = true;
		shortcut = "a";
		terminal = "tmux-256color";
		extraConfig = ''
			set -g set-clipboard on

            set -g status-interval 1

			set -g default-terminal "tmux-256color"
			set -ag terminal-overrides ",alacritty:RGB"
			set -as terminal-features ",alacritty:RGB"
			set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'
			set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'

			set -g status-position top
			set -g status-style 'bg=#1e1e2e'
			set -g message-command-style bg=default,fg=yellow
			set -g message-style bg=default,fg=yellow
			set -g mode-style bg=default,fg=yellow
			set -g status-right '#[fg=#b4befe,bg=#1e1e2e]%d-%m-%Y 󱑒 %H:%M:%S'
			set -g status-justify absolute-centre
			set -g status-right-length 200
			set -g window-status-current-format '#[fg=magenta,bg=#1e1e2e, bold]#I #W'
			set -g window-status-format '#[fg=gray,bg=#1e1e2e]#I #W'
		'';
	};
}

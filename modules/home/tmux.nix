{
	programs.tmux = {
		enable = true;
		baseIndex = 1;
		clock24 = true;
		escapeTime = 0;
		keyMode = "vi";
		mouse = true;
		shortcut = "a";
		extraConfig = ''
			set -g set-clipboard on

            set -g status-interval 1

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

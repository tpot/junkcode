; Disable deviant GUI stuff

(tool-bar-mode)
(menu-bar-mode)
(scroll-bar-mode)

; Enable auto-revert mode by default

(auto-revert-mode)

; Some basic keybindings

(global-set-key [f4] (lambda () (interactive) (message buffer-file-name)))
(global-set-key [(meta g)] 'goto-line)

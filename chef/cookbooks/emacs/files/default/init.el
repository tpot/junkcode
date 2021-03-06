; Disable deviant GUI stuff

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

; Enable auto-revert mode by default

(auto-revert-mode 1)

; Some basic keybindings

(global-set-key [f4] (lambda () (interactive) (message buffer-file-name)))
(global-set-key [f5] 'previous-error)
(global-set-key [f6] 'next-error)
(global-set-key [f12] 'undo)

(global-set-key [(meta g)] 'goto-line)

; Cucumber feature mode
(add-to-list 'load-path "~/.emacs.d")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

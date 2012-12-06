(setq initial-scratch-message "")
(put 'set-goal-column 'disabled nil)
(setq make-backup-files nil)
(put 'eval-expression 'disabled nil)
(show-paren-mode) 
(setq global-linum-mode t)
(setq column-number-mode t)
(add-to-list 'load-path "~/.emacs.d/addons/")
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "xe"     'eval-last-sexp)


(add-to-list 'load-path "~/.emacs.d")
(require 'move-line)
(global-set-key [M-up] 'move-line-up)
(global-set-key [M-down] 'move-line-down)
(key-chord-define-global ".."     'move-region-up)

(set-goal-column 1)


















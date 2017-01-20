(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa")
  (package-refresh-contents))

(when (not (package-installed-p 'magit)) (package-install 'magit))
(when (not (package-installed-p 'yaml-mode)) (package-install 'yaml-mode))

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

; No splash screen
(setq inhibit-startup-message t)

; no junk in scratch
(setq initial-scratch-message "")

(setq make-backup-files nil)
;(setq backup-directory-alist `(("." . "/tmp/")))

(ido-mode t)
(line-number-mode)
(column-number-mode)
(global-linum-mode 1) ; Show line numbers on buffers
(setq blink-matching-paren-distance nil) ; Blinking parenthesis
(setq undo-limit 100000)                       ; Increase number of undo
(defalias 'yes-or-no-p 'y-or-n-p)              ; y/n instead of yes/no
(setq mouse-yank-at-point t)                   ; Paste at cursor position

(setq-default indent-tabs-mode nil) ;Use spaces instead of tabs
(setq tab-width 4) ; Length of tab is 4 SPC


;; Theme:

(when (not (package-installed-p 'zenburn-theme)) (package-install 'zenburn-theme))
(load-theme 'zenburn t)

;(setq resize-emacs-command "/usr/bin/wmctrl -r emacs -e 0,15,15,1200,1200")
;(start-process "wmctrl" "foo" resize-emacs-command)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("146d24de1bb61ddfa64062c29b5ff57065552a7c4019bee5d869e938782dfc2a" default)))
 '(package-selected-packages (quote (yaml-mode ## zenburn-theme magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(if (member "--magit" command-line-args) (magit-status "./"))

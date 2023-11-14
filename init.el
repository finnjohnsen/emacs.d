(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(package-initialize)
(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa")
  (package-refresh-contents))

(when (not (package-installed-p 'xclip)) (package-install 'xclip))
(when (not (package-installed-p 'magit)) (package-install 'magit))
(when (not (package-installed-p 'yaml-mode)) (package-install 'yaml-mode))
(when (not (package-installed-p 'clojure-mode)) (package-install 'clojure-mode))

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq make-backup-files nil)
(line-number-mode)
(column-number-mode)
(display-line-numbers-mode)
(setq blink-matching-paren-distance nil) ; Blinking parenthesis
(setq undo-limit 100000)                       ; Increase number of undo
(defalias 'yes-or-no-p 'y-or-n-p)              ; y/n instead of yes/noh
(setq mouse-yank-at-point t)                   ; Paste at cursor position

(setq-default indent-tabs-mode nil) ;Use spaces instead of tabs
(setq tab-width 4) ; Length of tab is 4 SPC

; magit log vis ekte tidspunkt
(set-default 'magit-log-margin '(t "%Y-%m-%d %H:%M " magit-log-margin-width t 18))

(when (not (package-installed-p 'zenburn-theme)) (package-install 'zenburn-theme))
(load-theme 'zenburn t)

(if (member "--magit" command-line-args)
    (progn 
      (magit-status "./")
      (delete-other-windows)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(xclip zig-mode clojure-mode cljsbuild-mode zenburn-theme yaml-mode magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(xterm-mouse-mode)

; Keybinds
(global-set-key (kbd "C-c /") 'comment-region)
(global-set-key (kbd "C-c ?") 'uncomment-region)

;; check OS type
(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (progn
    (message "Microsoft Windows")))
 ((string-equal system-type "darwin") ; Mac OS X
  (progn
    (setq mac-option-key-is-meta nil)
    (setq mac-command-key-is-meta t)
    (setq mac-command-modifier 'meta)
    (setq mac-option-modifier nil)
    (message "Mac OS X")))
 ((string-equal system-type "gnu/linux") ; linux
  (progn
    (message "Linux"))))

(xclip-mode 1)

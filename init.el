(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(package-initialize)
(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa")
  (package-refresh-contents))

(when (not (package-installed-p 'magit)) (package-install 'magit))
(when (not (package-installed-p 'yaml-mode)) (package-install 'yaml-mode))
(when (not (package-installed-p 'clojure-mode)) (package-install 'clojure-mode))
(when (not (package-installed-p 'zig-mode)) (package-install 'zig-mode))


(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq make-backup-files nil)
(line-number-mode)
(column-number-mode)
(global-linum-mode 1) ; Show line numbers on buffers
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
   '(zig-mode clojure-mode cljsbuild-mode zenburn-theme yaml-mode magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

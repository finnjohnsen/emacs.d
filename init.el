(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not (package-installed-p 'magit)) (package-install 'magit))

(add-to-list 'load-path user-emacs-directory)
(eval-after-load 'clojure (require 'setup-clojure))
(eval-after-load 'keychord (require 'setup-keychord))
(eval-after-load 'javascript (require 'setup-javascript))

(setq initial-scratch-message "")
(setq backup-directory-alist `(("." . "/tmp/")))


(key-chord-define-global ".." 'move-region-up)
(key-chord-define-global ",." 'next-multiframe-window)
(key-chord-define-global ".," 'previous-multiframe-window) 
(key-chord-define-global ",." 'next-multiframe-window)
(key-chord-define-global ".," 'previous-multiframe-window) 
(key-chord-define-global ";;" '(lambda()(interactive)(enlarge-window 5)))
(key-chord-define-global "::" '(lambda()(interactive)(shrink-window 5)))

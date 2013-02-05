(unless (package-installed-p 'clojure-mode) (package-install 'clojure-mode))
(unless (package-installed-p 'nrepl) (package-install 'nrepl))
(unless (package-installed-p 'paredit) (package-install 'paredit-mode))
(unless (package-installed-p 'rainbow-delimiters) (package-install 'rainbow-delimiters))

(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode) 
(add-hook 'clojure-mode-hook 'show-paren-mode) 

(add-hook 'clojure-mode-hook 'clojure-test-mode)

(defun start-nrepl-if-not-started() 
  (unless (get-buffer "*nrepl*") 
      (nrepl-jack-in)
    ))

(add-hook 'clojure-mode-hook 'start-nrepl-if-not-started)
(add-hook 'clojure-mode-hook 'clojure-test-mode)

;(defun override-slime-repl-bindings-with-paredit ()
; (define-key slime-repl-mode-map
;    (read-kbd-macro paredit-backward-delete-key) nil))

;(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)
;(add-hook 'nrepl-mode-hook 'rainbow-delimiters-mode)

(provide 'setup-clojure)

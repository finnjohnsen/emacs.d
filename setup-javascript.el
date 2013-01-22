(when (not (package-installed-p 'slime)) (package-install 'slime))
(when (not (package-installed-p 'slime-js)) (package-install 'slime-js))
(when (not (package-installed-p 'js2-mode)) (package-install 'js2-mode))
(when (not (package-installed-p 'js2-refactor)) (package-install 'js2-refactor))

(set-default 'swank-started nil)

(autoload 'js2-mode "js2-mode" nil t)

(global-set-key [f5] 'slime-js-reload)
(add-hook 'js2-mode-hook
          (lambda ()
            (slime-js-minor-mode 1)))

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(defadvice save-buffer (after js-buffer activate)
  "reloads the javascript file"
  (when (and swank-started (eq major-mode 'js2-mode))
    (slime-js-reload)))

(defun swank-js ()
  "Runs the swank side of the equation."
  (interactive)
  (apply 'make-comint "swank-js" "swank-js" nil '() )
  (paredit-mode)
  (sleep-for 1)
  (slime-connect "127.0.0.1"  "4005")
  (slime-js-minor-mode t)
  (setq swank-started t))


  

(provide 'setup-javascript)

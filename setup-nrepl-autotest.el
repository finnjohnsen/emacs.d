(setq clojure-my-tests "(clojure.test/run-all-tests)")
(setq notify-command "notify-send Test \"%s\"")

(defun run-my-tests ()
  (shell-command-to-string
   (format notify-command
     (nth 3 (nrepl-eval clojure-my-tests)))))

(defadvice save-buffer (after buffer activate)
  "Reruns tests on every save if we're in nrepl minor mode"
  (if ( and (assq 'nrepl-macroexpansion-minor-mode minor-mode-alist) (eq major-mode 'clojure-mode))
    (run-my-tests)))

(provide 'setup-nrepl-autotest)

(provide 'move-line)
(defun move-line-up ()
  "moves current line 1 up"
  (interactive)
  (move-current-line t)
)
(defun move-line-down ()
  "moves current line 1 down"
  (interactive)
  (move-current-line)
)
(defun move-current-line (&optional up)
  "moved current line up or down according to argument given"
  (let ((column (current-column)))
    (if up (progn
	       (move-beginning-of-line())
	       (kill-whole-line)
	       (previous-line)
	       (move-beginning-of-line())
	       (yank)
	       (previous-line))
      (progn
	(move-beginning-of-line())
	(kill-whole-line)
	(next-line)
	(yank)
	(previous-line)
	))
    (move-to-column column)))










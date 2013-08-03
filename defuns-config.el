;; --------------------
;; -- Global defuns ---
;; --------------------
;;; Code:
(defun next5()
  (interactive)
  (next-line 5))

(defun prev5()
  (interactive)
  (previous-line 5))

(defun my-change-number-at-point (change)
  (let ((number (number-at-point))
	(point (point)))
    (when number
      (progn
	(forward-word)
	(search-backward (number-to-string number))
	(replace-match (number-to-string (funcall change number)))
	(goto-char point)))))
(defun increment-number-at-point ()
  "Increment number at point like vim's C-a"
  (interactive)
  (my-change-number-at-point '1+))
(defun decrement-number-at-point ()
  "Decrement number at point like vim's C-x"
  (interactive)
    (my-change-number-at-point '1-))

(defun goto-match-paren (arg)
  "Go to the matching parenthesis if on parenthesis, otherwise insert %.
  vi style of % jumping to matching brace."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(defun delete-word (arg)
  "Delete characters forward until encountering the end of a word.
With argument, do this that many times."
  (interactive "p")
  (delete-region (point) (progn (forward-word arg) (point))))

(defun backward-delete-word (arg)
  "Delete characters backward until encountering the end of a word.
With argument, do this that many times.
http://www.emacswiki.org/emacs/BackwardDeleteWord
"
  (interactive "p")
  (delete-word (- arg)))

(defun back-window ()
  (interactive)
  (other-window -1))

(defun whitespace-cleanup-all ()
  (interactive)
  (setq indent-tab-mode nil)
  (whitespace-cleanup))

(defun whitespace-clean-and-compile ()
  "Cleans up whitespace and compiles. The compile-command is a
varies with the active mode."
  (interactive)
  (whitespace-cleanup-all)
  (compile compile-command))

(defvar real-keyboard-keys
  '(("M-<up>"        . "\M-[1;3A")
    ("M-<down>"      . "\M-[1;3B")
    ("M-<right>"     . "\M-[1;3C")
    ("M-<left>"      . "\M-[1;3D")
    ("C-<return>"    . "\C-j")
    ("C-<delete>"    . "\M-[3;5~")
    ("C-<up>"        . "\M-[1;5A")
    ("C-<down>"      . "\M-[1;5B")
    ("C-<right>"     . "\M-[1;5C")
    ("C-<left>"      . "\M-[1;5D"))
  "An assoc list of pretty key strings
and their terminal equivalents.")

(defun key (desc)
  (or (and window-system (read-kbd-macro desc))
      (or (cdr (assoc desc real-keyboard-keys))
	  (read-kbd-macro desc))))

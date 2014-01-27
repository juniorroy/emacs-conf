;;redefining key bind to invoke other-window command
(global-set-key "\C-x\C-n" 'other-window)

;;define function to move cursor to previous window
;;because emacs haven't predefined function or command
(defun other-window-backward (&optional n)
  "Select Nth previous window."
  (interactive "P")
  (other-window (- (prefix-numeric-value n))))

;;;and bind it to key
(global-set-key "\C-x\C-p" 'other-window-backward)

;;to make it ease to scroll up or down
;;define functions and bind them
(defalias 'scroll-ahead 'scroll-up)
(defalias 'scroll-behind 'scroll-down)

(defun scroll-n-lines-ahead (&optional n)
  "Scroll ahead N lines (1 by default)"
  (interactive "P")
  (scroll-ahead (prefix-numeric-value n)))

(defun scroll-n-lines-behind (&optional n)
  "Scroll behind N lines (1 by default)"
  (interactive "P")
  (scroll-behind (prefix-numeric-value n)))

(global-set-key "\C-q" 'scroll-n-lines-behind)
(global-set-key "\C-z" 'scroll-n-lines-ahead)

;;restore bindings for C-q
(global-set-key "\C-x\C-q" 'quoted-insert)

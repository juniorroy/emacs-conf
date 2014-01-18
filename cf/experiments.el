;;redefining key bind to invoke other-window command
(global-set-key "\C-x\C-n" 'other-window)

;;define function to move cursor to previous window
;;because emacs haven't predefined function or command
(defun other-window-backward ()
  "Select previous window."
  (interactive)
  (other-window -1))
;;;and bind it to key
(global-set-key "\C-x\C-p" 'other-window-backward)

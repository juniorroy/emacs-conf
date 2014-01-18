(require 'erc)

(require 'erc-join)
(erc-autojoin-mode t)
(setq erc-autojoin-channels-alist
      '(
        ("freenode.net" "#clnoobs" "#lispcafe" "#lisp" "#lispweb")
        ))

(require 'erc-lang)

(require 'erc-fill)
(erc-fill-mode t)

(setq erc-user-full-name "juniorroy")
(setq erc-email-userid "juniorroy.web@gmail.com")

(require 'erc-log)
(setq erc-log-insert-log-on-open nil)
(setq erc-log-channels t)
(setq erc-log-channels-directory "~/.emacs.d/log/.irclogs/")
(setq erc-save-buffer-on-part t)
(setq erc-hide-timestamps nil)

(setq erc-max-buffer-size 20000)

(require 'erc-autoaway)
(setq erc-autoaway-idle-seconds 1200)
(setq erc-autoaway-message "I'm gone (autoaway after %i seconds)")
(setq erc-auto-discard-away t)

(setq erc-auto-query 'buffer)

(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT"))

(require 'erc-services)
(erc-nickserv-mode 1)
(setq erc-prompt-for-nickserv-password nil)

(require 'erc-menu)

(defun erc-connect ()
  "Connect to IRC."
  (interactive)
  (progn
    (erc-select :server "irc.freenode.net" :port 6667 :nick "juniorroy")
  ))

(custom-set-variables
 ;; '(erc-encoding-coding-alist (quote (("#clojure-de" . utf-8) ("#debian-russian" . cyrillic-koi8) ("#altlinux" . cyrillic-koi8) ("#unix.ru" . cyrillic-koi8) ("#fidorus" . cyrillic-koi8))))
 '(erc-nick "juniorroy")
 '(erc-nick-uniquifier "_")
 '(erc-prompt-for-password nil)
 '(erc-kill-queries-on-quit t)
 '(erc-server-coding-system (quote utf-8))
 )

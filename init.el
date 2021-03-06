;;In this file only paths to external
;;config

;;common configuration to emacs
;;excluding preferences for modes
(load "~/.emacs.d/cf/default.el")

;;c lang
(load "~/.emacs.d/cf/cc-mode.el")

;;gnus usenet connection settings
(load "~/.emacs.d/cf/gnus.el")

;;slime settings
(load "~/.emacs.d/cf/slime.el")

;;irc client erc settings
(load "~/.emacs.d/cf/erc.el")

;;trying some ex while reading about emacs extentions
(load "~/.emacs.d/cf/experiments.el")

;;
;;(load "/usr/share/doc/git/contrib/emacs/git.el")
;;(load "/usr/share/doc/git/contrib/emacs/git-blame.el")
(add-to-list 'load-path "/usr/share/doc/git/contrib/emacs")
(load "~/.emacs.d/cf/git-cf.el")

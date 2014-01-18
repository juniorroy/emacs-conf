;;load color theme
(load-theme 'misterioso t)

;;copied from rigidus web page 16.01.2013
;; Установки автоопределения кодировок. Первой будет определяться utf-8-unix
(prefer-coding-system 'cp866)
(prefer-coding-system 'koi8-r-unix)
(prefer-coding-system 'windows-1251-dos)
(prefer-coding-system 'utf-8-unix)

;; Режим по умолчанию c переносом строк по ширине 80
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq auto-fill-mode t)
(setq fill-column 80)

;; Удаляем оконечные пробелы перед сохранением файлов
(add-hook 'before-save-hook '(lambda ()
(delete-trailing-whitespace)))
;; Создание резервных копий редактируемых файлов (Backup)
;; нумерованный бэкап - 2 первых и 2 последних
(setq  backup-by-copying t      ; don't clobber symlinks
       backup-directory-alist  '(("." . "~/backup"))    ; don't litter my fs tree
       delete-old-versions t            ;; удаление промежуточных бэкапов
       kept-new-versions 6
       kept-old-versions 2
       version-control t)       ; use versioned backups

;; Интерфейс
(setq transient-mark-mode '1)           ;; Show marked text
(setq font-lock-maximum-decoration t)   ;;
(set-scroll-bar-mode 'right)            ;; Полоса прокрутки справа
(setq inhibit-startup-message t)        ;; Не показываем сообщение при старте
(fset 'yes-or-no-p 'y-or-n-p)		;; не заставляйте меня печать "yes" целиком
(setq default-tab-width 4)              ;; размер табуляции
(setq-default indent-tabs-mode nil)     ;; отступ только пробелами
(setq initial-scratch-message nil)      ;; Scratch buffer settings. Очищаем его.
(setq scroll-conservatively 50)         ;; гладкий скроллинг с полями
(setq scroll-preserve-screen-position 't)
(setq scroll-margin 10)
(setq column-number-mode t)             ;; show column & line numbers in status bar
(setq line-number-mode t)
(setq my-author-name (getenv "USER"))
(setq user-full-name (getenv "USER"))
(recentf-mode 1)                        ;; Recent files in menu
;; мышка...
(global-set-key [vertical-scroll-bar down-mouse-1] 'scroll-bar-drag)
                                    ;; Scroll Bar gets dragged by mouse butn 1
(setq mouse-yank-at-point 't) 		;; Paste at point NOT at cursor
(mouse-wheel-mode 1)			;; колесо мышки

;; http://kulchitsky.org/rus/linux/dotemacs.html
;; Установка раскладки как в виндовс при переключении по С-\
(global-set-key (kbd "\C-\\") 'user-toggle-input-method)
;(global-set-key (kbd "\e(") 'user-to-cyr) ; Alt+Shift+9
;(global-set-key (kbd "\e)") 'user-to-nil) ; Alt+Shift+0


(defun user-cyrillic-redefinitions ()
  "Set of global keys binding for cyrillic.
   This function is to be called from user-toggle-input-method"
  (global-set-key (kbd "?") (lambda()(interactive)(insert ",")))
  (global-set-key (kbd "/") (lambda()(interactive)(insert ".")))
  (global-set-key (kbd ",") (lambda()(interactive)(insert ":")))
  (global-set-key (kbd ":") (lambda()(interactive)(insert "%")))
  (global-set-key (kbd "*") (lambda()(interactive)(insert ";")))
  (global-set-key (kbd ";") (lambda()(interactive)(insert "*")))
  (global-set-key (kbd ".") (lambda()(interactive)(insert "?"))))

(defun user-nil-redefinitions () "Restoring global keys binding after user-cyrillic-redefinitions. This function is to be called from user-toggle-input-method" (global-set-key (kbd "?") (lambda()(interactive)(self-insert-command 1))) (global-set-key (kbd "/") (lambda()(interactive)(self-insert-command 1))) (global-set-key (kbd "$") (lambda()(interactive)(self-insert-command 1))) (global-set-key (kbd ",") (lambda()(interactive)(self-insert-command 1))) (global-set-key (kbd ":") (lambda()(interactive)(self-insert-command 1))) (global-set-key (kbd "*") (lambda()(interactive)(self-insert-command 1))) (global-set-key (kbd ";") (lambda()(interactive)(self-insert-command 1))) (global-set-key (kbd ".") (lambda()(interactive)(self-insert-command 1))))

(defun user-toggle-input-method ()
  "Change the stadart function tuggle-input-method
   to redefine keys for cyrillic input from UNIX type to win type"
  (interactive)
  (toggle-input-method)
  (if (string= current-input-method "cyrillic-jcuken")
      (user-cyrillic-redefinitions)
    (user-nil-redefinitions))
  (message "keybord changed to %s" current-input-method))

(defun user-to-cyr () "Change input method to Cyrillic, I bound this function with Alt-Shift-9, that is M-(" (interactive) (when (string= current-input-method nil) (user-toggle-input-method)))

(defun user-to-nil ()
  "Change input method to nil (generally to English),
   I bound this function with Alt-Sfift-0 that is M-)"
  (interactive)
  (when (string= current-input-method "cyrillic-jcuken")
      (user-toggle-input-method)))

;;=cut copied from rigidus web page 16.01.2013

;;remove tool, scroll and menu bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;set BS command to C-h and help invoke bind to M-?
(global-set-key "\e?" 'help-command)
(global-set-key "\C-h" 'delete-backward-char)

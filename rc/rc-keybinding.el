;;; rc-kbd.el --- Keyboard Settings

;; Copyright (C) 2012  Chen Hsin-Yi

;; Author: hychen <ossug.hychen@gmail.com>

;; Keep Emacs alive!!!
;;(global-set-key (kbd "C-x C-c") (lambda ()
;;                                 (interactive) (message "Don't quit")))

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Text Size scale
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Bind C-2 to C-@ so emacs-gtk2 behaves like in xterm
(global-set-key (kbd "C-2") 'set-mark-command)

;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-z") 'eshell)

;; Start a new eshell even if one is active.
(global-set-key (kbd "C-Z") (lambda () (interactive) (eshell t)))

;; Better formate of buffer list
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Search help documents by using regex
(global-set-key (kbd "C-h a") 'apropos)

(provide 'rc-keybinding)

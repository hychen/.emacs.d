;;; rc-kbd.el --- Keyboard Settings

;; Copyright (C) 2012  Chen Hsin-Yi

;; Author: hychen <ossug.hychen@gmail.com>
(package-require 'ace-jump-mode)
(require 'ace-jump-mode)

;; enabling fast/direct cursor movement in current view
;; ref: http://www.emacswiki.org/emacs/AceJump
(define-key global-map (kbd "C-3") 'ace-jump-mode)

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

;; Better formate of buffer list
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Search help documents by using regex
(global-set-key (kbd "C-h a") 'apropos)

;; Behave like vi's o command
(defun open-next-line (arg)
  "Move to the next line and then opens a line.
   See also `newline-and-indent'."
      (interactive "p")
      (end-of-line)
      (open-line arg)
      (next-line 1)
      (when newline-and-indent
        (indent-according-to-mode)))

(global-set-key [S-return]   'open-next-line)

(provide 'rc-keybinding)

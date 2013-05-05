;;; rc-kbd.el --- Keyboard Settings

;; Copyright (C) 2012  Chen Hsin-Yi

;; Author: hychen <ossug.hychen@gmail.com>
(package-require 'ace-jump-mode)
(package-require 'multiple-cursors)
(require 'ace-jump-mode)
(require 'multiple-cursors)

;; Multiple cursors for Emacs.  https://github.com/magnars/multiple-cursors.el
;; When you have an active region that spans multiple lines, the following will add a cursor to each line:
(global-set-key (kbd "C-3") 'mc/edit-lines)
;; When you want to add multiple cursors not based on continuous lines, but based on keywords in the buffer, use:
(global-set-key (kbd "C-4") 'mc/mark-all-like-this)

;; enabling fast/direct cursor movement in current view
;; ref: http://www.emacswiki.org/emacs/AceJump
(global-set-key (kbd "C-;") 'ace-jump-mode)

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
;;(global-unset-key-map (kbd "C-space")

;; ------------------------
;; Moving lines or regions
;; ref: code copied from http://stackoverflow.com/questions/2423834/move-line-region-up-and-down-in-emacs
;; ------------------------
(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg))
        (forward-line -1))
      (move-to-column column t)))))

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)

(provide 'rc-keybinding)

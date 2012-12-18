;;; rc-kbd.el --- Keyboard Settings

;; Copyright (C) 2012  Chen Hsin-Yi

;; Author: hychen <ossug.hychen@gmail.com>

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

;; Start multi-term or switch to it if it's active.
(global-set-key (kbd "C-z") 'multi-term)

;; Better formate of buffer list
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Search help documents by using regex
(global-set-key (kbd "C-h a") 'apropos)

;; navigating among the tabs of one tab group - 
(global-set-key (kbd "<M-up>") 'tabbar-backward-group)
(global-set-key (kbd "<M-down>") 'tabbar-forward-group)
(global-set-key (kbd "<M-left>") 'tabbar-backward)
(global-set-key (kbd "<M-right>") 'tabbar-forward)

;; Smart copy, if no region active, it simply copy the current whole line
;; Orign: http://emacser.com/torture-emacs.htm
(defadvice kill-line (before check-position activate)
  (if (member major-mode
	      '(emacs-lisp-mode
		scheme-mode lisp-mode
		c-mode
		c++-mode
		objc-mode
		js-mode
		python-mode
		haskell-mode
		latex-mode
		plain-tex-mode))
      (if (and (eolp) (not (bolp)))
	  (progn (forward-char 1)
		 (just-one-space 0)
		 (backward-char 1)))))

(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive (if mark-active (list (region-beginning) (region-end))
		 (message "Copied line")
		 (list (line-beginning-position)
		       (line-beginning-position 2)))))

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
	   (line-beginning-position 2)))))

;; Copy line from point to the end, exclude the line break
(defun qiang-copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (point)
		  (line-end-position))
  ;; (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(global-set-key (kbd "M-k") 'qiang-copy-line)
;; Smart copy end

;; expand region
;;(rc-require 'er/expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; ace jump
(rc-require 'ace-jump-mode)
(global-set-key (kbd "C-0") 'ace-jump-mode)

;; iedit
(global-set-key (kbd "C-;") 'iedit-mode)

(provide 'rc-keybinding)

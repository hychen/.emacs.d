;;; rc-dired.el --- Dired Settings

;; Copyright (C) 2012  Chen Hsin-Yi

;; Author: Chen Hsin-Yi <ossug.hychen@gmail.com>
;; Keywords: comm
(require 'dired-x)

;; Don't display hidden files, can be toggled by M-o
(setq dired-omit-files "\\(^\\.[^\\.].*$\\|^\\.\\..+$\\)")
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))
;; Highlight Current Line
(add-hook 'dired-mode-hook 'hl-line-mode)

(provide 'rc-dired)
;;; rc-dired.el --- Dired Settings

;; Copyright (C) 2012  Chen Hsin-Yi

;; Author: Chen Hsin-Yi <ossug.hychen@gmail.com>
;; Keywords: comm
(require 'dired-x)

(setq dired-omit-files "\\(^\\.[^\\.].*$\\|^\\.\\..+$\\)")

(add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))
(add-hook 'dired-mode-hook 'hl-line-mode)

(provide 'rc-dired)

(require 'dired-x)
(setq dired-omit-files "\\(^\\.[^\\.].*$\\|^\\.\\..+$\\)")

(add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))
(add-hook 'dired-mode-hook 'hl-line-mode)
(provide 'rc-filemgr)

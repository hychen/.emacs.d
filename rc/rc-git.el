(require-package 'magit)

(require 'magit)

(global-set-key (kbd "C-x g") 'magit-status)

(add-to-list 'auto-mode-alist '("\\.gitconfig$" . conf-mode))

(provide 'rc-git)

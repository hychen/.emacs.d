(require-package 'json-mode)
(require-package 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.jsm" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))

(add-hook 'js-mode-hook 'js2-minor-mode)

(provide 'rc-js-mode)

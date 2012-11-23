;;; rc-moinmoin.el --- 

;; Copyright (C) 2012  Hsin-Yi Chen (hychen)

;; Author: Hsin-Yi Chen (hychen) <ossug.hychen@gmail.com>
;; Keywords: comm,
(rc-require 'moinmoin-mode)

(add-to-list 'auto-mode-alist '("\\.moinmoin$" . moinmoin-mode))

(provide 'rc-moinmoin)

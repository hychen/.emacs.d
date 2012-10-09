;;; rc-multi-term.el --- Multi-Term Settings

;; Copyright (C) 2012  Chen Hsin-Yi

;; Author: Chen Hsin-Yi <ossug.hychen@gmail.com>
;; Keywords: lisp
(rc-require 'multi-term)

;; Set Terminal program and buffer name
;; Move focus to dedicated terminal
(setq multi-term-program "/bin/bash")
(setq multi-term-buffer-name "term")
(setq multi-term-dedicated-select-after-open-p t)

(provide 'rc-multi-term)

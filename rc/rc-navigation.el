(require-package 'window-number)
(require-package 'ido-ubiquitous)

(require 'ido-ubiquitous)
(require 'window-number)

;; Window Navigation
;; Use meta + N to switch between windows instead of
;; C-x C-j
(window-number-meta-mode)

;; ido-mode is like magic pixie dust!
(ido-mode t)
(ido-ubiquitous t)
(ido-everywhere t)
(setq ido-enable-prefix nil 
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil 
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)

(provide 'rc-navigation)

;;; rc-misc.el -- Misc Settings
(require-package 'window-number)
(require-package 'undo-tree)
(require-package 'ido-ubiquitous)
;;(require-package 'edit-server)

;;(when (and (daemonp) (locate-library "edit-server"))
;;  (require 'edit-server)
;;  (edit-server-start))

(require 'undo-tree)
(require 'ido-ubiquitous)
(require 'window-number)

;; Revert buffer from disk always if content is different.
(global-auto-revert-mode t)

;; Window Navigation
;; Use meta + N to switch between windows instead of
;; C-x C-j
(window-number-meta-mode)

;; Use text-mode as default
(setq default-major-mode 'text-mode)

;; Don't clutter up directories with files~
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (locate-user-emacs-file "backups")))))

;; Seed the random-number generator
(random t)

;; undo-tree mode
(eval-after-load 'undo-tree
  '(global-undo-tree-mode))

;; text-mode with auto fill and flyspell
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)

;; ispell
(setq ispell-dictionary "american")

;; Transparently open compressed files
(auto-compression-mode t)

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

;; Use y instead of yes, and n insted of no
(defalias 'yes-or-no-p 'y-or-n-p)

;; http://www.emacswiki.org/emacs/PythonProgrammingInEmacs
(delete-selection-mode t)

;; Cua mode
(setq cua-enable-cua-keys nil)
(cua-mode t)

(provide 'rc-misc)

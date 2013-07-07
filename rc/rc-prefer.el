;; Revert buffer from disk always if content is different.
(global-auto-revert-mode t)

;; Use text-mode as default
(setq default-major-mode 'text-mode)

;; Don't clutter up directories with files~
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (locate-user-emacs-file "backups")))))

;; Seed the random-number generator
(random t)

;; ispell
(setq ispell-dictionary "american")

;; text-mode with auto fill and flyspell
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)

;; Transparently open compressed files
(auto-compression-mode t)


;; Use y instead of yes, and n insted of no
(defalias 'yes-or-no-p 'y-or-n-p)

;; http://www.emacswiki.org/emacs/PythonProgrammingInEmacs
(delete-selection-mode t)

;; Cua mode
(setq cua-enable-cua-keys nil)
(cua-mode t)

(provide 'rc-prefer)

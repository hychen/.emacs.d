(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "apple" :slant normal :weight normal :height 113 :width normal)))))
(set-fontset-font (frame-parameter nil 'font)
    'unicode '("WenQuanYi Zen Hei" . "unicode-bmp") 'nil 'append)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(font-use-system-font t)
 '(org-agenda-files (quote ("~/Ubuntu One/org/notes/course" 
                            "~/Ubuntu One/org/notes/social"
                            "~/Ubuntu One/org/notes/portfolio"
                            "~/Ubuntu One/org/notes/shopping"
                            "~/Ubuntu One/org/dayplanner/")))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(virtualenv-root "/home/hychen/.virtualenv/"))

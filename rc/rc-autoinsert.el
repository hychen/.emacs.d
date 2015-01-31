;;; rc-autoinsert.el
(require 'autoinsert)

(add-hook 'find-file-hooks 'auto-insert)

; Insert if possible, but mark as unmodified.                                        
(setq auto-insert 'other)

; Auto-inserting whithout asking.
(setq auto-insert-query nil)

                                        
(add-to-list 'auto-insert-alist
             '(("\\.org\\'" . "Org-mode header")
               "Short description: "
               "#+TITLE:" (file-name-nondirectory (file-name-sans-extension (buffer-file-name))) "\n"
               "#+AUTHOR:" (user-full-name) "\n"
               "#+OPTIONS: H:2 num:t toc:nil\n"
               "#+OPTIONS: ^:nil\n"
               "#+OPTIONS: <:nil todo:nil *:t ^:{} @:t ::t |:t TeX:t\n"
               ))

(provide 'rc-autoinsert)

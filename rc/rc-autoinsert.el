;;; rc-autoinsert.el
(require 'autoinsert)

; Insert if possible, but mark as unmodified.                                        
(setq auto-insert 'other)

; Auto-inserting whithout asking.
(setq auto-insert-query nil)

                                        
(add-to-list 'auto-insert-alist
             '(("\\.org\\'" . "Org-mode header")
               "#+TITLE:"
               ))

(provide 'rc-autoinsert)

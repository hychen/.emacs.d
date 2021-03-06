(require-package 'undo-tree)
(require-package 'autopair)

(require 'undo-tree)
(require 'autopair)

;; Undo Tree
(eval-after-load 'undo-tree
  '(global-undo-tree-mode))
         
;; This makes sure that brace structures (), [], {}, etc. are closed as soon as the opening character is typed. 
(autopair-global-mode)

;; ------------------------
;; Moving lines or regions
;; ref: code copied from http://stackoverflow.com/questions/2423834/move-line-region-up-and-down-in-emacs
;; ------------------------
(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg))
        (forward-line -1))
      (move-to-column column t)))))

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)

(provide 'rc-editing)

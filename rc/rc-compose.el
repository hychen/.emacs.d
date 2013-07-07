(require-package 'undo-tree)
(require-package 'multiple-cursors)

(require 'undo-tree)
(require 'multiple-cursors)

;; Undo Tree
(eval-after-load 'undo-tree
  '(global-undo-tree-mode))

;; Multiple cursors for Emacs.  https://github.com/magnars/multiple-cursors.el
;; When you have an active region that spans multiple lines, the following will add a cursor to each line:
(global-set-key (kbd "C-3") 'mc/edit-lines)
;; When you want to add multiple cursors not based on continuous lines, but based on keywords in the buffer, use:
(global-set-key (kbd "C-4") 'mc/mark-all-like-this)

;; Behave like vi's o command
(defun open-next-line (arg)
  "Move to the next line and then opens a line.
   See also `newline-and-indent'."
      (interactive "p")
      (end-of-line)
      (open-line arg)
      (next-line 1)
      (when newline-and-indent
        (indent-according-to-mode)))

(global-set-key [S-return]   'open-next-line)
;;(global-unset-key-map (kbd "C-space")

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

;; ispell
(setq ispell-dictionary "american")

;; text-mode with auto fill and flyspell
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)

;; http://www.emacswiki.org/emacs/PythonProgrammingInEmacs
(delete-selection-mode t)

;; Cua mode
(setq cua-enable-cua-keys nil)
(cua-mode t)


(provide 'rc-compose)

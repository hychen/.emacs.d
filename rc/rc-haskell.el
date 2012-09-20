;;; rc-haskell.el -- Haskell Mode Settings

;; Copyright (C) 2012  Chen Hsin-Yi

;; Author: Chen Hsin-Yi <ossug.hychen@gmail.com>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
(rc-require 'haskell-mode)

(eval-after-load 'haskell-mode
  `(progn
   ;; Indent
   ;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
   (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
   ;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
   ;; Use Unicode symbols
   (setq haskell-font-lock-symbols t)
     ))

(provide 'rc-haskell)
;; rc-haskell.el ends here

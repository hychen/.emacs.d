;;; init.el --- Where all the magic begins

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

;; Personal Infomation
(setq user-full-name "Chen Hsin-Yi")
(setq user-mail-address "ossug.hychen@gmail.com")

;; Set init file for custom settings
(setq custom-file (locate-user-emacs-file "custom.el"))

;; Load path etc.
(add-to-list 'load-path (locate-user-emacs-file "rc"))

;; Load features that needs to be loaded early in startup
(require 'rc-appearance)
(require 'rc-package)

;; Generic Modes
(require 'rc-keybinding)
(require 'rc-auto-insert)
(require 'rc-misc)

;; Documenting Modes
(require 'rc-yaml)
(require 'rc-markdown)

;; Version Control Modes
(require 'rc-git)

;; Programming Modes
(require 'rc-python)
(require 'rc-lisp)
(require 'rc-haskell)

(load custom-file 'noerror)
;;; Init.el end

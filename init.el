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
(setq user-full-name "Hsin-Yi Chen (hychen)")
(setq user-mail-address "ossug.hychen@gmail.com")

;; Set init file for custom settings
(setq custom-file (locate-user-emacs-file "custom.el"))
;; Set init file for prviate custom settings.
(defvar private-file (locate-user-emacs-file "private.el"))

;; Load path etc.
(add-to-list 'load-path (locate-user-emacs-file "rc"))
(add-to-list 'custom-theme-load-path (locate-user-emacs-file "themes"))

;; Load features that needs to be loaded early in startup
(require 'rc-package)

;; Generic Modes
(require 'rc-appearance)
(require 'rc-prefer)
(require 'rc-navigation)
(require 'rc-ido)
(require 'rc-ibuffer)

;; Documenting Modes
(require 'rc-markdown)
(require 'rc-org)

;; Version Control Modes

;; Programming Modes
(require 'rc-js-mode)
(require 'rc-web-mode)

;; start emacs server.
(load private-file 'noerror)
(load custom-file 'noerror)
;;; Init.el end

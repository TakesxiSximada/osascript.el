;;; osascript.el ---

;; Copyright (C) 2018 by TakesxiSximada

;; Author: TakesxiSximada <sximada@gmail.com>
;; URL: https://github.com/TakesxiSximada/osascript.el
;; Version: 0.01

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

;;; Commentary:

;; https://developer.apple.com/library/content/documentation/AppleScript/Conceptual/AppleScriptLangGuide/reference/ASLR_cmds.html

;;; Code:
(defun osascript-cmd-say (msg)
  (async-shell-command (format "say %s" msg)))


(defun osascript-generate-display-notification (msg &optional sub-title with-title)
  (concat "osascript "
          " -e 'display notification "
          (format " \"%s\" " (or with-title "..."))
          (format " subtitle \"%s\" " (or sub-title "Emacs"))
          (format " with title \"%s\" " (or msg "Message!!"))
          "'"))

(defun osascript-cmd-display-notification (msg &optional sub-title with-title)
  (async-shell-command
   (osascript-generate-display-notification msg sub-title with-title)))


(provide 'osascript)

;;; osascript.el ends here

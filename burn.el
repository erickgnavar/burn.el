;;; burn.el --- Burn your code by replacing it with 🔥

;; Copyright © 2020 Erick Navarro
;; Author: Erick Navarro <erick@navarro.io>
;; URL: https://github.com/erickgnavar/burn.el
;; Version: 0.1.0
;; SPDX-License-Identifier: GNU General Public License v3.0 or later

;;; Commentary:
;; Replace the buffer content with 🔥.

;;; Code:

(defun burn--replace-at-point ()
  "Replace the character at point with 🔥."
  (delete-char 1)
  (insert "🔥"))

(defun burn--replace-line ()
  "Burn code in the current line."
  (while (< (point) (line-end-position))
    (sit-for 0.05)
    (burn--replace-at-point)))

(defun burn-code ()
  "Replace code with 🔥 emoji."
  (interactive)
  (while (< (line-number-at-pos) (line-number-at-pos (point-max)))
    (progn
      (beginning-of-line)
      (burn--replace-line)
      (forward-line))))

;;; burn.el ends here

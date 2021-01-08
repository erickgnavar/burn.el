;;; burn.el --- Burn your code by replacing it with 🔥

;; Copyright © 2020 Erick Navarro
;; Authors: Erick Navarro <erick@navarro.io>, Andros Fenollosa <andros@fenollosa.email>
;; URL: https://github.com/erickgnavar/burn.el
;; Version: 0.2.0
;; SPDX-License-Identifier: GNU General Public License v3.0 or later

;;; Commentary:
;; Replace the buffer content with 🔥.

;;; Code:

(setf burn--emoji "🔥")

(defun burn--is-exist-emoji ()
    (goto-char 1)
    (search-forward burn--emoji)
    (equal (point) 1))

(defun burn--replace-backward-at-point ()
  "Replace the backwards character at point with burn--emoji."
  (re-search-backward (concat "[^" burn--emoji "]") 1)
  (delete-char 1)
  (insert burn--emoji))

(defun burn--replace-forward-at-point ()
  "Replace the forward character at point with burn--emoji."
  (re-search-forward (concat "[^" burn--emoji "]") 1)
  (delete-char 1)
  (insert burn--emoji))

(defun burn-code ()
  "Replace code with burn--emoji."
  (interactive)
  (while burn--is-exist-emoji
    (sit-for 1.05)
    (burn--replace-backward-at-point)
    (burn--replace-forward-at-point)
    ))

;;; burn.el ends here


-*- lexical-binding: t; -*-
;;; burn.el --- Burn your code by replacing it with 🔥

;; Copyright © 2020 Erick Navarro
;; Authors: Erick Navarro <erick@navarro.io>, Andros Fenollosa <andros@fenollosa.email>
;; URL: https://github.com/erickgnavar/burn.el
;; Version: 0.2.0
;; SPDX-License-Identifier: GNU General Public License v3.0 or later

;;; Commentary:
;; Replace the buffer content with 🔥.

;;; Code:

(defvar burn--emoji "🔥")
(defvar burn--interval 0.001)

(defun burn--is-empty ()
  "Check if there is nothing left to burn."
  (= 0 (length
        (replace-regexp-in-string (concat "\\`[ \t\n" burn--emoji "]*") ""
                                  (replace-regexp-in-string (concat "[ \t\n" burn--emoji "]*\\'") "" (buffer-string))))))

(defun burn--replace-backward-at-point ()
  "Replace the backwards character at point with burn--emoji."
  (when (re-search-backward (concat "[^ \t\n" burn--emoji "]") nil :noerr)
    (replace-match burn--emoji)))

(defun burn--replace-forward-at-point ()
  "Replace the forward character at point with burn--emoji."
  (when (re-search-forward (concat "[^ \t\n" burn--emoji "]") nil :noerr)
    (replace-match burn--emoji)))

(defun burn-code ()
  "Replace code with burn--emoji."
  (interactive)
  ;; Burn
  (while (not (burn--is-empty))
    (sit-for burn--interval)
    (burn--replace-backward-at-point)
    (burn--replace-forward-at-point))
  (erase-buffer))

;;; burn.el ends here


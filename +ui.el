;;; ~/.doom.d/+ui.el -*- lexical-binding: t; -*-

;; No, we do not need the splash screen
(setq inhibit-startup-screen t)

;; Theme
(setq doom-theme 'doom-snazzy)

;; Fonts
(setq doom-font (font-spec :family "Menlo" :size 16))


(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))


;; company-mode auto-completion, to turn off use :company-complete
(require 'company)
(setq company-idle-delay 0.2
      company-minimum-prefix-length 3)

;; Set initial frame size and position
(defun my/set-initial-frame ()
  (let* ((base-factor 1.0)
	(a-width (* (display-pixel-width) base-factor))
        (a-height (* (display-pixel-height) base-factor))
        (a-left (truncate (/ (- (display-pixel-width) a-width) 2)))
	(a-top (truncate (/ (- (display-pixel-height) a-height) 2))))
    (set-frame-position (selected-frame) a-left a-top)
    (set-frame-size (selected-frame) (truncate a-width)  (truncate a-height) t)))
(setq frame-resize-pixelwise t)
(my/set-initial-frame)


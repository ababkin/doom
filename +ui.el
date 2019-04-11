;;; ~/.doom.d/+ui.el -*- lexical-binding: t; -*-

;; No, we do not need the splash screen
(setq inhibit-default-init t)

;; Theme
; (setq doom-theme 'doom-snazzy)
; (setq doom-theme 'doom-one)
(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

(load-theme 'doom-solarized-light t)
;; (setq doom-theme 'doom-snazzy)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme (all-the-icons must be installed!)
(doom-themes-neotree-config)
;; or for treemacs users
(doom-themes-treemacs-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)



;; Fonts
(setq doom-font (font-spec :family "Fira Mono" :size 16))
(setq doom-big-font (font-spec :family "Fira Mono" :size 22))

; the standard emacs way to set font
; (add-to-list 'default-frame-alist
             ; '(font . "Fira Mono")) 



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


;; neotree
(setq doom-neotree-file-icons t)

(def-package-hook! doom-themes
  :post-config
  (remove-hook 'doom-load-theme-hook #'doom-themes-neotree-config)
)

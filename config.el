;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
;; (projectile-add-known-project "~/symbiont/symbiont-node/src/capybara/sym-cli")

(load! "+ui")      ;; My ui mods. Also contains ligature stuff.

;; wrap lines
(setq-default truncate-lines nil)

;; cycle through frames
(global-set-key (kbd "s-$") 'other-frame)

(global-set-key (kbd "C-s-h") 'sp-beginning-of-sexp)
(global-set-key (kbd "C-s-l") 'sp-end-of-sexp)
(global-set-key (kbd "C-s-j") 'sp-down-sexp)
(global-set-key (kbd "C-s-k") 'sp-up-sexp)
(global-set-key (kbd "C-s-J") 'sp-backward-down-sexp)
(global-set-key (kbd "C-s-K") 'sp-backward-up-sexp)

;; Haskell

(add-hook 'haskell-mode-hook (lambda ()
            (haskell-indent-mode)))

;; run stylish haskell on save
(custom-set-variables
 '(haskell-stylish-on-save t))

(custom-set-variables
 '(haskell-off 2)
 '(haskell-indent-offset 2))

;; hpack based projects
(after! projectile
  (projectile-register-project-type 'hpack '("package.yaml")
                    :compile "si ."
                    :test "st ."))


(add-hook 'haskell-mode-hook
  (lambda ()
    ; (setq projectile-tags-command "hasktags --ctags .")))
    (setq projectile-tags-command "fast-tags -Re --exclude=.stack-work --exclude=dist-newstyle .")
    (with-eval-after-load 'flycheck
      (setq-default flycheck-disabled-checkers '(haskell-stack-ghc haskell-ghc haskell-hlint)))
  )
)

; (after! projectile
  ; (setq projectile-tags-command "hasktags --ctags ."))

; (setq projectile-tags-command "fast-tags -Re --exclude=.stack-work --exclude=dist-newstyle .")

(map! :leader
    (:prefix "p"
    :n "g" #'haskell-mode-generate-tags))



;; Agda

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))

;; Using the input method of Agda in LaTeX files.
(require 'agda-input)
(add-hook 'LaTeX-mode-hook
          (lambda () (set-input-method "Agda")))


(map! :leader
    :nv "a" nil
    (:prefix "a"
    :n "l" #'agda2-load))


(require 'evil-replace-with-register)
;; change default key bindings (if you want) HERE
(setq evil-replace-with-register-key (kbd "t"))
(evil-replace-with-register-install)


; https://blog.aaronbieber.com/2016/01/23/living-in-evil.html
; (add-hook 'occur-mode-hook
          ; (lambda ()
            ; (evil-add-hjkl-bindings occur-mode-map 'emacs
              ; (kbd "/")       'evil-search-forward
              ; (kbd "n")       'evil-search-next
              ; (kbd "N")       'evil-search-previous
              ; (kbd "C-d")     'evil-scroll-down
              ; (kbd "C-u")     'evil-scroll-up
              ; (kbd "C-w C-w") 'other-window)))

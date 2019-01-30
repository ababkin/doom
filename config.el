;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
;; (projectile-add-known-project "~/symbiont/symbiont-node/src/capybara/sym-cli")

(load! "+ui")      ;; My ui mods. Also contains ligature stuff.


; (defun mycommand () (interactive) (print "da"))


;; Haskell

;; run stylish haskell on save
(custom-set-variables
 '(haskell-stylish-on-save t))

;; hpack based projects
(after! projectile
  (projectile-register-project-type 'hpack '("package.yaml")
                    :compile "si ."
                    :test "st ."))


(add-hook 'haskell-mode-hook
  (lambda ()
    (setq projectile-tags-command "hasktags --ctags .")))

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

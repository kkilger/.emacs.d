(defgroup my-init-helm nil
  "Initialize helm et al." 
  :group 'my-init
  :prefix 'my-init-helm)

(use-package helm
  :ensure t)

(use-package helm-cmd-t
  :ensure t)

(defun my-helm-quit-keys ()
  (define-key helm-map (kbd "ESC") 'helm-keyboard-quit))

(add-hook 'after-init-hook 'my-helm-quit-keys)

(use-package projectile
  :init
  (progn
    (setq projectile-completion-system 'helm)
    (setq projectile-enable-caching t)
    (setq projectile-switch-project-action 'helm-projectile))
  :config
  (projectile-global-mode)
  :ensure t)

(use-package helm-projectile
  :config
  (helm-projectile-on)
  :ensure t)

;; settings for helm-M-x and helm find files 
(setq helm-M-x-fuzzy-match t) ;; enable fuzzy search for M-x
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-p") 'projectile-switch-project)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(use-package helm-descbinds
  :defer t
  :bind (("C-h b" . helm-descbinds)) 
  :ensure t)

(provide 'init-helm)

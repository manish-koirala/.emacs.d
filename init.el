(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(set-frame-parameter nil 'alpha-background 95)
(add-to-list 'default-frame-alist '(alpha-background . 95))

(setq inhibit-startup-message t)

(setq visible-bell t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq electric-pair-pairs '(
			    (?\< . ?\>)
			    (?\{ . ?\})			    
			    (?\( . ?\))
			    (?\[ . ?\])
			    (?\" . ?\")
			    ))
(electric-pair-mode t)

(add-to-list 'default-frame-alist '( font . "JetBrainsMono Nerd Font-11" ))

(setq make-backup-files nil)
(setq auto-save-default nil)

(setq display-line-numbers-type 'relative)  
(global-display-line-numbers-mode 1)

(fido-vertical-mode 1)

;; Doom Themes
(unless (package-installed-p 'doom-themes)
  (package-install 'doom-themes))

;; Zenburn Theme
(unless (package-installed-p 'zenburn-theme)
  (package-install 'zenburn-theme))

;; Solarized Theme
(unless (package-installed-p 'solarized-theme)
  (package-install 'solarized-theme))

;; Spacemacs Theme
(unless (package-installed-p 'spacemacs-theme)
  (package-install 'spacemacs-theme))

;; Gruvbox Theme
(unless (package-installed-p 'gruvbox-theme)
  (package-install 'gruvbox-theme))

;; Use correct theme.
(load-theme 'spacemacs-dark t)

;; Yasnippet
(use-package "yasnippet"
  :ensure t
  :config
  (yas-global-mode t))

;; Magit
(use-package "magit"
  :ensure t)

(use-package "spaceline"
  :ensure t
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator (quote arrow))
  (spaceline-spacemacs-theme))

(use-package "diminish" ; Remove these default minor modes.
  :ensure t
  :init
  (diminish 'which-key-mode)
  (diminish 'linum-relative-mode)
  (diminish 'hungry-delete-mode)
  (diminish 'visual-line-mode)
  (diminish 'subword-mode)
  (diminish 'beacon-mode)
  (diminish 'irony-mode)
  (diminish 'page-break-lines-mode)
  (diminish 'auto-revert-mode)
  (diminish 'rainbow-delimiters-mode)
  (diminish 'rainbow-mode)
  (diminish 'yas-minor-mode)
  (diminish 'flycheck-mode)
  (diminish 'helm-mode))

(use-package "org-bullets" ; Better org bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; Vterm
(use-package "vterm"
  :ensure t)

;; Vterm toggle.
(use-package vterm-toggle
  :bind
  (("C-`"        . vterm-toggle)
   :map vterm-mode-map
   ("<C-return>" . vterm-toggle-insert-cd))
  :config
  (add-to-list 'display-buffer-alist
	       '("\*vterm\*"
		 (display-buffer-in-side-window)
		 (window-height . 0.3)
		 (side . bottom)
		 (slot . 0))))

(use-package "corfu"
  :ensure t
  :config
  (global-corfu-mode 1))

(use-package "evil"
  :ensure t)

(use-package "treesit-auto"
  :ensure t
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(add-hook 'python-ts-mode-hook  'eglot-ensure)
(add-hook 'c-ts-mode-hook 'eglot-ensure)
(add-hook 'c++-ts-mode-hook 'eglot-ensure)
(add-hook 'typescript-ts-mode-hook 'eglot-ensure)
(add-hook 'js-ts-mode-hook 'eglot-ensure)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(vterm-toggle treesit-auto zenburn-theme yasnippet vterm vertico spacemacs-theme spaceline solarized-theme org-bullets magit gruvbox-theme evil doom-themes diminish corfu)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

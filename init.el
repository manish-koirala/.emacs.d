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

(use-package "dashboard"
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents . 5)
			  (projects . 5))))

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

(use-package "vterm"
  :ensure t)

(use-package "corfu"
  :ensure t)

(use-package "evil"
  :ensure t)

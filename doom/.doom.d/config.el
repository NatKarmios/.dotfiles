;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Nat Karmios"
      user-mail-address "nat@karmios.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
;; from 'https://emacs.stackexchange.com/questions/38183/how-to-exclude-a-file-from-agenda'
(custom-set-variables
 '(org-agenda-custom-commands
   '(("A" "Ignore habits"
      ((agenda ""))
      ((org-agenda-tag-filter-preset '("-HABIT")))))))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq fancy-splash-image "~/.doom.d/doom_emacs.png")

;(add-hook 'typescript-mode-hook #'setup-tide-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js-indent-level 2)
 '(package-selected-packages '(awscli-capf)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq org-capture-inbox-file "~/org/inbox.org")
(after! org
  (setq org-capture-templates
   '(("t" "Personal todo" entry
        (file org-capture-inbox-file)
      "* TODO %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n%i" :prepend t)
        ("T" "Personal todo (with link)" entry
        (file org-capture-inbox-file)
      "* TODO %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n%i\n%A" :prepend t)
        ("n" "Personal notes" entry
        (file org-capture-inbox-file)
      "* %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n%i" :prepend t)
        ("N" "Personal notes (with link)" entry
        (file org-capture-inbox-file)
      "* %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n%i\n%A" :prepend t)
   )
   )
)

;; Open weblinks in Windows, if on WSL
(let ((cmd-exe "/usr/bin/wslview"))
    (when (file-exists-p cmd-exe)
      (setq browse-url-generic-program  cmd-exe
            browse-url-browser-function 'browse-url-generic)))

(setq org-log-done 'time)

(setq vterm-shell "/usr/bin/zsh")

(setq lsp-enable-symbol-highlighting t)
(setq lsp-ui-doc-enable t)
(setq lsp-lens-enable t)
(setq lsp-headerline-breadcrumb-enable t)
(setq lsp-ui-sideline-enable t)
(setq lsp-ui-sideline-show-code-actions t)
(setq lsp-ui-sideline-enable t)
(setq lsp-ui-sideline-show-hover t)
(setq lsp-modeline-code-actions-enable t)
(setq lsp-signature-auto-activate t)
(setq lsp-signature-render-documentation t)

(add-to-list 'company-backends 'company-keywords)
(add-to-list 'company-backends 'company-capf)

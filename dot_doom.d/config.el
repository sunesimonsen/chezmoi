;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Sune Simonsen"
      user-mail-address "sune@we-knowhow.dk"
      zendesk (getenv "ZENDESK_CODE_DIR"))

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;

(when (eq system-type 'darwin)
  (setq doom-font "Menlo-16"))

(when (eq system-type 'gnu/linux)
  (setq doom-font "DejaVu Sans Mono-16"))


;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; æøå
(map!
 :i
 :map key-translation-map
 "M-'" (kbd "æ")
 "M-o" (kbd "ø")
 "M-a" (kbd "å")
 "M-\"" (kbd "Æ")
 "M-O" (kbd "Ø")
 "M-A" (kbd "Å"))

;; UI
(setq mac-right-option-modifier 'meta)
(setq ns-right-option-modifier  'meta)

;; Hack to fix titlebar
(add-hook 'doom-after-init-hook
          (lambda () (tool-bar-mode 1) (tool-bar-mode 0)))

;; Evil
(setq
 evil-snipe-scope 'whole-visible
 evil-ex-search-persistent-highlight nil)

;; start maximized
(add-hook! window-setup #'toggle-frame-maximized)

;; window management
(after! winum
  (map! :leader
        :n "0"      #'winum-select-window-0-or-10
        :n "1"      #'winum-select-window-1
        :n "2"      #'winum-select-window-2
        :n "3"      #'winum-select-window-3
        :n "4"      #'winum-select-window-4
        :n "5"      #'winum-select-window-5
        :n "6"      #'winum-select-window-6
        :n "7"      #'winum-select-window-7
        :n "8"      #'winum-select-window-8
        :n "9"      #'winum-select-window-9))

;; evil-walk-on-the-edge
(after! evil
  (evil-define-motion evil-move-forward-paren (count)
    "Move forward to next (, [, {, }, ] or )"
    :jump t
    :type inclusive
    (interactive "<c>")
    (setq count (or count 1))
    (forward-char)
    (re-search-forward "\\s(\\|\\s)" nil 'end-of-buffer count)
    (while (and (in-string-p) (< (point) (point-max)))
      (re-search-forward "\\s(\\|\\s)" nil 'end-of-buffer))
    (backward-char))

  (evil-define-motion evil-move-backward-paren (count)
    "Move backward to previous (, [, {, }, ] or )"
    :jump t
    :type inclusive
    (interactive "<c>")
    (setq count (or count 1))
    (re-search-backward "\\s(\\|\\s)" nil 'beginning-of-buffer count)
    (while (and (in-string-p) (> (point) (point-min)))
      (re-search-backward "\\s(\\|\\s)")))

  (map!
   :nm "C-;" #'evil-move-backward-paren
   :nm "C-'" #'evil-move-forward-paren))

;; runtests
(use-package! runtests
  :commands runtests
  :init
  (map! :leader :nm "ct" #'runtests))

(after! org
  (setq
   org-capture-templates
   '(("t" "Todo" entry (file+headline "" "Tasks")
      "* TODO %?\n  %u")
     ("l" "Todo (location)" entry (file+headline "" "Tasks")
      "* TODO %?\n  %u\n  %a")
     ("u" "Todo (url)" entry (file+headline "" "Tasks")
      "* TODO %?\n  %u\n  %^C")
     ("m" "Todo (mail)" entry (file+headline "" "Tasks")
      "* TODO %?%a\n  %u"))

   org-cycle-separator-lines 0
   org-directory "~/Dropbox/org"
   org-roam-directory "~/Dropbox/org/roam"
   org-roam-index-file "~/Dropbox/org/roam/index.org"
   org-agenda-files '("~/Dropbox/org/notes.org")
   org-default-notes-file "~/Dropbox/org/notes.org"
   org-refile-targets '((org-agenda-files :level . 1))
   org-refile-use-outline-path nil
   org-agenda-custom-commands
   '(("i" "Inbox" tags-todo "+inbox")
     ("j" "Agenda and all TODOs"
      ((agenda "")
       (tags-todo "+inbox")
       (tags-todo "+zendesk")
       (tags-todo "+home")
       (tags-todo "+unexpected")
       (tags-todo "+buy")))))

  (defun org-agenda-show-agenda-and-todo (&optional arg)
    "Agenda overview"
    (interactive "P")
    (org-agenda arg "j"))

  (map! :leader
        :desc "Agenda overview"
        "oo" 'org-agenda-show-agenda-and-todo))

;; Disable smartparens
(add-hook! smartparens-enabled
  (turn-off-smartparens-mode))

;; Avy
(setq avy-all-windows t)

(remove-hook 'doom-first-input-hook #'evil-snipe-mode)

(after! evil-snipe
  (map! :nm "s" #'evil-avy-goto-word-1
        :nm "S" #'evil-avy-goto-char-timer))

;; Projectile
(after! projectile
  (appendq! projectile-other-file-alist
            '(("js" "spec.js")
              ("spec.js" "js")
              ("spec.rb" "rb")
              ("rb" "spec.rb")))


  (map! :leader :nm "pt" #'projectile-run-vterm)

  ;; re-index with projectile-discover-projects-in-search-path
  (setq projectile-project-search-path '(("~/Code" . 2))))

;; Ruby
(add-hook! ruby-mode
  (setq-local flycheck-command-wrapper-function
              (lambda (command) (append '("bundle" "exec") command))))

;; Disable format all for specific modes
;;(setq +format-on-save-enabled-modes
;;      (append +format-on-save-enabled-modes '(ruby-mode mhtml-mode)))

;; Company
(after! company
  (map! :i "C-x C-l" 'evil-complete-previous-line)

  ;; allow code completion matching all buffer
  (setq company-dabbrev-code-other-buffers 'all)
  (setq company-dabbrev-other-buffers 'all)

  ;; Disable automatic popup
  (setq company-idle-delay nil))

;; Magit
(after! magit
  (setq magit-git-environment
        (append magit-git-environment
                (list "TERM=dumb" "COLOR=0"))))

;; gotmpl
(define-derived-mode gohtml-mode html-mode "Go HTML mode"
  "A major mode for Go HTML templates")

(add-to-list 'auto-mode-alist '("\\.gohtml\\'" . gohtml-mode))
;; Denote
(use-package! denote
  :init
  (defun denote-open-dired-directory ()
    (interactive)
    (dired denote-directory)
    (dired-hide-details-mode))

  (setq denote-directory (file-truename "~/Dropbox/org/denote/"))
  (setq denote-known-keywords '(zendesk project tools js gtd))

  (setq denote-inbox-file
        (concat denote-directory "20231228T091750--inbox__gtd_star.org"))
  ;;(directory-files denote-directory)
  ;;
  (defun denote-find ()
    (interactive)
    (let ((default-directory denote-directory))
      (ido-find-file)))

  (map! :leader
        (:prefix-map ("d" . "denote")
         :desc "Dired" "d" #'denote-open-dired-directory
         :desc "Inbox" "i" (lambda()
                             (interactive)
                             (find-file denote-inbox-file))
         :desc "New" "n" #'denote
         :desc "Find" "f" #'denote-find
         (:prefix-map ("r" . "Rename")
          :desc "Using front matter" "f" #'denote-rename-file-using-front-matter)
         (:prefix-map ("l" . "Link")
          :desc "Insert" "l" #'denote-insert-link
          :desc "Insert (REGEX)" "r" #'denote-link-insert-links-matching-regexp)
         (:prefix-map ("k" . "Keyword")
          :desc "Add" "a" #'denote-keywords-add
          :desc "Remove" "r" #'denote-keywords-remove))))


(use-package! ispell
  :init
  (setq ispell-program-name "hunspell")
  (setq ispell-local-dictionary "en_US")
  (setq ispell-local-dictionary-alist
        '(
          ("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)
          ("da_DK" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "da_DK") nil utf-8)))
  (setq ispell-hunspell-dictionary-alist ispell-local-dictionary-alist))

(when zendesk
  ;; runner
  (use-package! vterm
    :init
    (setq vterm-runner-commands
          '(("guide-client:start" "~/Code/zendesk/guide-client" "yarn start\n")
            ("guide-client:markup-editor:watch" "~/Code/zendesk/guide-client/packages/guide-client-markup-editor" "yarn watch\n")
            ("guide-client:storybook:start" "~/Code/zendesk/guide-client" "yarn storybook:start\n")
            ("guide-client:markup-editor:start" "~/Code/zendesk/guide-client/packages/guide-client-markup-editor" "yarn start\n")))

    (let* ((app-dir "~/Code/zendesk/guide-client/apps")
           (apps (directory-files app-dir)))

      (dolist (app apps)
        (unless (member app '("." ".."))
          (push
           (list (concat "guide-client:" app ":start") (concat app-dir "/" app) "yarn start\n")
           vterm-runner-commands))))

    (defun vterm-runner-run ()
      (interactive)
      (let* ((command-name
              (completing-read
               "Run: "
               vterm-runner-commands
               nil t ""))
             (command-config (assoc command-name vterm-runner-commands))
             (path (cadr command-config))
             (command (caddr command-config))
             (default-directory path)
             (command-buffer-name (concat "*" command-name "*"))
             (command-buffer (get-buffer command-buffer-name)))

        (if command-buffer
            (display-buffer command-buffer)
          (vterm command-buffer-name)
          (vterm-send-string command)
          (evil-force-normal-state))))

    (map! :leader
          (:prefix-map ("r" . "run")
           :desc "Terminal" "t" #'vterm-runner-run)))

  (use-package! chatgpt-shell
    :init
    (setq chatgpt-shell-api-url-base "https://ai-gateway.zende.sk")
    (setq chatgpt-shell-openai-key
          (lambda ()
            (let ((auth (car (auth-source-search :host "ai-gateway.zende.sk" :requires '(secret)))))
              (funcall (plist-get auth :secret)))))))

;; Make Eglot faster
(after! jsonrpc
  (fset #'jsonrpc--log-event #'ignore))

(after! eglot
  (setq eglot-ignored-server-capabilities
        '(:colorProvider
          :documentHighlightProvider
          :foldingRangeProvider)))

(add-hook
 'eglot-managed-mode-hook
 (lambda ()
   ;; we want eglot to setup callbacks from eldoc, but we don't want eldoc
   ;; running after every command. As a workaround, we disable it after we just
   ;; enabled it. Now calling `M-x eldoc` will put the help we want in the eldoc
   ;; buffer. Alternatively we could tell eglot to stay out of eldoc, and add
   ;; the hooks manually, but that seems fragile to updates in eglot.
   (eldoc-mode -1)
   ))

(after! eldoc
  (setq eldoc-echo-area-prefer-doc-buffer t)
  (map! :leader :nm "h." #'eldoc))


(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (setq treesit-auto-recipe-list
        `(,(make-treesit-auto-recipe
            :lang 'typescript
            :ts-mode 'typescript-ts-mode
            :remap 'typescript-mode
            :requires 'tsx
            :url "https://github.com/tree-sitter/tree-sitter-typescript"
            :revision "v0.20.3"
            :source-dir "typescript/src"
            :ext "\\.ts\\'")
          ,(make-treesit-auto-recipe
            :lang 'tsx
            :ts-mode 'tsx-ts-mode
            :remap '(typescript-tsx-mode)
            :requires 'typescript
            :url "https://github.com/tree-sitter/tree-sitter-typescript"
            :revision "v0.20.3"
            :source-dir "tsx/src"
            :ext "\\.tsx\\'")))

  ;;  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package typescript-ts-mode
  :mode (("\\.tsx?\\'" . tsx-ts-mode)
         ("\\.jsx?\\'" . tsx-ts-mode)))

(use-package eglot
  :hook
  ((js-ts-mode . eglot-ensure)
   (tsx-ts-mode . eglot-ensure)
   (typescript-ts-mode . eglot-ensure)
   (go-mode . eglot-ensure)
   (go-ts-mode . eglot-ensure)
   (go-mod-mode . eglot-ensure)
   (go-mod-ts-mode . eglot-ensure)))

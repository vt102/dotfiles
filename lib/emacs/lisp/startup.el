(setq-default load-path 
              (append (list (concat (getenv "HOME") "/lib/emacs/lisp"))
		      (list "/usr/local/lib/emacs/site-lisp")
		      load-path))

(global-set-key [f1] 'save-buffer)              ;F1
(global-set-key [f2] 'save-buffer)              ;F2

(setq auto-save-list-file-prefix (concat (getenv "HOME")
					 "/.saves/"))


;; Let's make _sure_ we don't conflict my key binding with other pkgs...
(global-unset-key "\C-z")

(andy-byte-compile-if-newer-and-load  "show-point-mode")


;; The C Programming Language
;; http://www.emacswiki.org/emacs/IndentingC
(setq-default c-default-style "k&r"
	      c-basic-offset 4)

(autoload #'espresso-mode "espresso" "Start espresso-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))

(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))


;;(andy-byte-compile-if-newer-and-load  "andy-ro.el")

(display-time)

;; Let's use really long, descriptive names and just bind them to keys.

(defun andy-kill-point-to-end-of-buffer ()
  "Nuke text from here to end of buffer."
  (interactive "*")
  (kill-region (point) (point-max)))

(defun andy-kill-entire-line (arg)
  "Nuke a entire line, not just a \C-k."
  (interactive "*p")
  (beginning-of-line nil)
  (kill-line arg)
  (if (= (point) (point-max))
      (progn
        (forward-line -1)
        (end-of-line nil)
        (kill-line arg)
        (beginning-of-line nil))))

(global-set-key "\C-z\C-d" 'andy-kill-entire-line)

(defun andy-open-line-vi-style ()
  "Do a more vi-style open line, moving point down one line and to the left."
  (interactive "*")
  (end-of-line nil)
  (insert ?\n))

(global-set-key "\C-z\C-z" 'suspend-emacs)
(global-set-key "\C-z\C-k" 'andy-kill-point-to-end-of-buffer)
(global-set-key "\C-zg" 'goto-line)
(global-set-key "\C-zk" 'kill-buffer)
(global-set-key "\C-zo" 'andy-open-line-vi-style)
(global-set-key "\C-zp" 'fill-paragraph)
(global-set-key "\C-zm" 'man)
(global-set-key "\C-zd" 'describe-function)
(global-set-key "\C-za" 'command-apropos)
(global-set-key "\C-zi" 'info)
(global-set-key "\C-zf" 'isearch-forward)
(global-set-key "\C-zc" 'compile)

(define-key global-map "\C-x?" 'help-for-help)
(define-key global-map "\C-h" 'backward-delete-char) 
(define-key esc-map "q" 'quoted-insert)
(define-key esc-map "s" 'isearch-forward)



(defun word-count nil "Count words in buffer" (interactive)
  (shell-command-on-region (point-min) (point-max) "wc -w"))

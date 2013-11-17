(defun andy-byte-compile-if-newer-and-load (file)
  "Byte compile file.el if newer than file.elc"
  (interactive)
  (if (file-newer-than-file-p (concat file ".el")
                              (concat file ".elc"))
      (byte-compile-file (concat file ".el")))
  (load file))

(andy-byte-compile-if-newer-and-load 
	 (concat (getenv "HOME") "/lib/emacs/lisp/startup"))

;(require 'filladapt)

(put 'eval-expression 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(put 'upcase-region 'disabled nil)

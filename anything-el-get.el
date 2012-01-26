(require 'anything)
(require 'el-get)

(defmacro anything-el-get-marked-fn (fn)
  `(lambda (ignore)
     (dolist (candidates (anything-marked-candidates))
       (,fn candidates))))

;; 確認用
;; (macroexpand '(anything-el-get-marked-fn 'el-get-init))

;; 型
(define-anything-type-attribute 'el-get
  `((action
     ("Update" . ,(anything-el-get-marked-fn el-get-update))
     ("Install" . ,(anything-el-get-marked-fn el-get-install))
     ("Remove" . ,(anything-el-get-marked-fn el-get-remove))
     ("Remove Autoloads" . ,(anything-el-get-marked-fn el-get-remove-autoloads))
     ("Initialize" . ,(anything-el-get-marked-fn el-get-init))
     ("Describe" . ,(anything-el-get-marked-fn el-get-describe))
     ("Reload" . ,(anything-el-get-marked-fn el-get-reload))
     ("Find Recipe File" . ,(anything-el-get-marked-fn el-get-find-recipe-file))
     ("Open Package Directory" . ,(anything-el-get-marked-fn el-get-cd)))
    (persistent-action . el-get-describe)
    (candidate-number-limit)))

(defvar anything-c-source-el-get-basic
  '((name . "el-get")
    (candidates . el-get-read-all-recipe-names)
    (type . el-get)))

;;;###autoload
(defun anything-el-get ()
  (interactive)
  (anything-other-buffer anything-c-source-el-get-basic
                         "*anything-el-get*"))


(provide 'anything-el-get)

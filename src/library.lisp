(in-package :imgui)

;; stolen from cl-autowrap, cause i'm lazy!
(defun asdf-path (system &rest path)
  (asdf:component-pathname
   (or (asdf:find-component (asdf:find-system system t) path)
       (error "System ~S path not found: ~S" system path))))

(defun imgui-path (name)
  (asdf-path 'imgui 'imgui-lib name))

(eval
`(cffi:define-foreign-library imgui
  (:darwin    "imgui.so"  :search-path ,(asdf-path 'imgui 'imgui-lib))
  (:unix      "imgui.so"  :search-path ,(asdf-path 'imgui 'imgui-lib))
  (:windows   "imgui.dll" :search-path ,(asdf-path 'imgui 'imgui-lib))
  (t          "imgui.so"  :search-path ,(asdf-path 'imgui 'imgui-lib))))

(cffi:use-foreign-library imgui)

;;;; imgui.asd

(asdf:defsystem #:imgui
  :description "Bindings for dear imgui https://github.com/ocornut/imgui (Uses the C bindings from https://github.com/Extrawurst/cimgui)"
  :author "Justin Patera <serialhex@gmail.com>"
  :license "MIT"

  :depends-on (:cl-autowrap
               :sdl2
               :cl-opengl)

  :components
    ((:module imgui-lib
      :pathname "cimgui"
      :components
      ((:static-file "nk-lib.h")))

     (:module imgui-src
       :pathname "src"
       :serial t
       :components
       ((:file "package")
        (:file "util")
        (:file "autowrap")
        (:file "library")
        (:file "imgui")))
      ))

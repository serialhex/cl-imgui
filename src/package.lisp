;;;; package.lisp

(defpackage #:imgui-ffi)
(defpackage #:imgui-ffi.acc)
(defpackage #:imgui-ffi.fns)

(defpackage #:imgui
  (:use #:cl #:imgui-ffi.fns #:plus-c) ; i dont think i want to `use` sdl2...
  (:import-from #:plus-c #:&)
  (:export #:test))

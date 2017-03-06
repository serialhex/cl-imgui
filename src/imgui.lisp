
(in-package :imgui)

(defun mooo ()
  'moooo!)

(defun test ()
  (c-with ((ctx nk-ffi:nk-context)
         (lay nk-ffi:nk-panel))
    (format t "Pre: Context ~A; Panel ~A~%" ctx lay)
    (format t "Addresses: ctx ~A lay ~A~%" (ctx &) (lay &))
    (finish-output)
    (nk-begin (ctx &) (lay &) "Demo"
                            (nk-rect 50 50 210 250)
                            (logior nk-ffi:+nk-window-border+
                                    nk-ffi:+nk-window-movable+
                                    nk-ffi:+nk-window-scalable+
                                    nk-ffi:+nk-window-minimizable+
                                    nk-ffi:+nk-window-title+))
    (format t "Post: Context ~A; Panel ~A~%" ctx lay)
    (nk-end ctx)))

(defun sdl-test ()
  (sdl2:with-init (:everything)
    (sdl2:with-window (win :flags '(:shown :opengl))
      (sdl2:with-gl-context (gl-context win)

        ;; basic window/gl setup
        (format t "Setting up window/gl.~%")
        (finish-output)
        (sdl2:gl-make-current win gl-context)
        (gl:viewport 0 0 800 600)
        (gl:matrix-mode :projection)
        (gl:ortho -2 2 -2 2 -2 2)
        (gl:matrix-mode :modelview)
        (gl:load-identity)
        (gl:clear-color 0.0 0.0 1.0 1.0)
        (gl:clear :color-buffer)

        (c-with ((ctx nk-ffi:nk-context)
                 (lay nk-ffi:nk-panel))
          (format t "Pre: Context ~A; Panel ~A~%" ctx lay)
          (format t "Addresses: ctx ~A lay ~A~%" (ctx &) (lay &))
          (finish-output)

          (nk-begin (ctx &) (lay &) "Demo"
                                    (nk-rect 50 50 210 250)
                                    (logior nk-ffi:+nk-window-border+
                                            nk-ffi:+nk-window-movable+
                                            nk-ffi:+nk-window-scalable+
                                            nk-ffi:+nk-window-minimizable+
                                            nk-ffi:+nk-window-title+))
          (format t "Post: Context ~A; Panel ~A~%" ctx lay)
          (nk-end ctx))))))

;(MEMBER :CHAR :UNSIGNED-CHAR :SHORT :UNSIGNED-SHORT :INT :UNSIGNED-INT :LONG :UNSIGNED-LONG :LONG-LONG :UNSIGNED-LONG-LONG :FLOAT :DOUBLE :POINTER :VOID)

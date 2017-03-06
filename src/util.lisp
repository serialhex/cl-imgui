(in-package :imgui)



(defun list-fns ()
  (with-open-file (f "/tmp/imgui" :direction :output :if-exists :supersede)
    (let (fns)
      (do-external-symbols (s 'nk-ffi)
        (push (format nil "~A" s) fns))
      (format t "imgui-ffi package has ~A symbols~%" (length fns))
      (format f "~{~A~%~}" (sort fns #'string<))))
  (with-open-file (f "/tmp/imgui-fns" :direction :output :if-exists :supersede)
    (let (fns)
      (do-external-symbols (s 'nk-ffi.fns)
        (push (format nil "~A" s) fns))
      (format t "imgui-ffi.fns package has ~A symbols~%" (length fns))
      (format f "~{~A~%~}" (sort fns #'string<))))
  (with-open-file (f "/tmp/imgui-acc" :direction :output :if-exists :supersede)
    (let (fns)
      (do-external-symbols (s 'nk-ffi.acc)
        (push (format nil "~A" s) fns))
      (format t "imgui-ffi.acc package has ~A symbols~%" (length fns))
      (format f "~{~A~%~}" (sort fns #'string<)))))

(c-with ((x :int))                ;; same as c-let with :free T
  (format t "Value: ~A~%" x)                       ;; => whatever value was in memory
  (setf x 42)
  (format t "Pointer: ~A~%" (x &))                   ;; => &x (pointer)
  (format t "Value: ~A~%" x))                      ;; => 42

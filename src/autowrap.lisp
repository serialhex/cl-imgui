(cl:in-package :imgui-ffi)

(autowrap:c-include
 '(imgui imgui-lib "imgui-lib.h")
  :accessor-package :imgui-ffi.acc
  :function-package :imgui-ffi.fns
  :spec-path '(imgui imgui-lib)
  :exclude-sources ("/usr/local/lib/clang/([^/]*)/include/(?!stddef.h)"
                    "/usr/include/"
                    "/usr/include/arm-linux-gnueabihf"
                    "/usr/include/X11/"
                    "/usr/include/SDL2/")
  :include-sources ("stdint.h")
  :no-accessors cl:t
  ;:release-p cl:t
  ;:trace-c2ffi cl:t
  )

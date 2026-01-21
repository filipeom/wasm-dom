(module
  ;; 1. Import the JS function.
  ;; We expect it to be passed in an object like { env: { js_update_dom: ... } }
  (func $js_update_dom (import "env" "js_update_dom") (param i32))

  ;; 2. Export the function we will call from JS
  (func $run_benchmark (export "run_benchmark") (param $iterations i32)
    (local $i i32)

    (block $break_label
      (loop $loop_label

        ;; -- Check Condition --
        local.get $i
        local.get $iterations
        i32.ge_s
        br_if $break_label

        ;; -- Call JS Function --
        local.get $i
        call $js_update_dom

        ;; -- Increment Counter --
        local.get $i
        i32.const 1
        i32.add
        local.set $i

        ;; -- Repeat --
        br $loop_label
      )
    )
  )
)

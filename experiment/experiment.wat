(module
  (func $js_empty (import "env" "js_empty") (param i32))

  (func $js_dom (import "env" "js_dom") (param i32))

  (func $bench_empty (export "bench_empty") (param $iterations i32)
    (local $i i32)
    (block $break
      (loop $loop
        local.get $i
        local.get $iterations
        i32.ge_s
        br_if $break

        ;; Call the empty JS function
        local.get $i
        call $js_empty

        local.get $i
        i32.const 1
        i32.add
        local.set $i
        br $loop
      )
    )
  )

  (func $bench_dom (export "bench_dom") (param $iterations i32)
    (local $i i32)
    (block $break
      (loop $loop
        local.get $i
        local.get $iterations
        i32.ge_s
        br_if $break

        ;; Call the DOM updating JS function
        local.get $i
        call $js_dom

        local.get $i
        i32.const 1
        i32.add
        local.set $i
        br $loop
      )
    )
  )
)

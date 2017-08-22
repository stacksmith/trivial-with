# TRIVIAL-WITH

There are many Lisp idioms prefixed with `WITH-`.  By containing an environment (and often hiding the cleanup code) they make Lisp a great language.  However, a lot of nested `WITH-` clauses becomes a visual nuisance.

`TRIVIAL-WITH` is a simple library designed to contain multiple levels of `WITH-` invocations into a single `WITH:-` form.

It is implemented as a macro that expands into nested `WITH-xxx` forms.  So you can:
```
(with:all
  ((open-file (in "my-file"))
   (slots (x y) rect)
   ...)
 ...
)
```

# NOTES

## WITH- forms that return a value

Most with- style macros create an environment in the contained body of code.  There are exceptions such as with-output-to-string, which by default returns a string.  Placed inside a `with:all` macro the string would be lost (unless it `(with-output-to-string..)` form was the first one in the list.

`TRIVIAL-WITH` can capture the return value of a `(WITH-xxx)` by setting the value of a symbol that precedes the form by using `(with:side-effect var ...)

```
(with:all
  ((open-file (in "my-file"))
   (slots (x y) rect)
   (side-effect z (output-to-string (x))
   ...
  )
  ...
  )
```
The above will basically expand to `(setf z (with-output-to-string...))`  The variable z of course must be in scope for this to work.

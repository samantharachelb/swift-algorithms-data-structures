# Recursion

Solve a repetitive problem by repeatedly solving similar subproblems

- Doesn't always provide faster/efficient code, but it does provides an elegant alternative
to iterative approaches that require less code.

## Recursive Functions

A function is considered recursive if it calls itself. The function call can happen directly:
```swift
func r() {
  r()
}
```

The function call can also happen indirectly if the function calls another function which
invokes the first function.

```swift
func x() {
  y()
}

func y() {
  x()
}
```

## Recursive Data Structures

A data structure is considered recursive if you can describe it in terms of itself.

Eg: A linked list can be described as a list node followed by a linked list


## Recursion Pitfalls

if there is no exit condition for a recursive function, it will result in a stack overflow

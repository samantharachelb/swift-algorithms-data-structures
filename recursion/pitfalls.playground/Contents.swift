import Foundation

// improper implementation
// doesn't have a condtion to keep the nested call from being executed again and again
func badSum(n: Int) -> Int {
    print(n)
    return n + badSum(n: (n-1))
}

let res = badSum(n: 3)
print(res)

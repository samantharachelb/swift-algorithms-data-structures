import Foundation
typealias BigInt = _BigInt<UInt>


func factorial(n: BigInt) -> BigInt {
    return n < 2 ? 1 : n * factorial(n: n - 1)
}

//print(UInt64.max)
print(factorial(n: 100))


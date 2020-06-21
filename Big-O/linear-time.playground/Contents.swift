//: Linear Time - O(n)
import Foundation
import QuartzCore

// Benchmark Utility Implementation
public class BenchTimer {
    public static func measureBlock(closure:() -> Void) -> CFTimeInterval {
        let runCount = 10
        var executionTimes = Array<Double>(repeating: 0.0, count: runCount)
        for i in 0..<runCount {
            let startTime = CACurrentMediaTime()
            closure()
            let endTime = CACurrentMediaTime()
            let execTime = endTime - startTime
            executionTimes[i] = execTime
        }
        return (executionTimes.reduce(0, +)) / Double(runCount)
    }
}

// Function to generate arrays of a random size
func generateRandomArray(size: Int, maxValue: UInt32) -> [Int] {
    guard size > 0 else {
        return [Int]()
    }
    var result = [Int](repeating: 0, count: size)
    for i in 0..<size {
        result[i] = Int(arc4random_uniform(maxValue))
    }
    return result
}

// Function that sums up the elements in the input array
func sum(array: [Int]) -> Int {
    var result = 0
    for i in 0..<array.count {
        result += array[i]
    }
    return result
}

// Function that counts the even and odd numbers in an array
func countOddEven(array: [Int]) -> (even: UInt, odd: UInt) {
    var even: UInt = 0
    var odd: UInt = 0

    for element in array {
        if element % 2 == 0 {
            even += 1
        } else {
            odd += 1
        }
    }
    return (even, odd)
}

let arr10 = generateRandomArray(size: 10, maxValue: UInt32.max)
let arr100 = generateRandomArray(size: 100, maxValue: UInt32.max)
let arr1000 = generateRandomArray(size: 1000, maxValue: UInt32.max)
let arr10000 = generateRandomArray(size: 10000, maxValue: UInt32.max)

var arr10ExecTime = BenchTimer.measureBlock {
    _ = sum(array: arr10)
}
var arr100ExecTime = BenchTimer.measureBlock {
    _ = sum(array: arr100)
}
var arr1000ExecTime = BenchTimer.measureBlock {
    _ = sum(array: arr1000)
}
var arr10000ExecTime = BenchTimer.measureBlock {
    _ = sum(array: arr10000)
}
var arr10CountExecTime = BenchTimer.measureBlock {
    _ = countOddEven(array: arr10)
}
var arr100CountExecTime = BenchTimer.measureBlock {
    _ = countOddEven(array: arr100)
}
var arr1000CountExecTime = BenchTimer.measureBlock {
    _ = countOddEven(array: arr1000)
}
var arr10000CountExecTime = BenchTimer.measureBlock {
    _ = countOddEven(array: arr10000)
}
print("Avg. exec time for sum arr10: \t\t\(arr10ExecTime)")
print("Avg. exec time for sum arr100: \t\t\(arr100ExecTime)")
print("Avg. exec time for sum arr1000: \t\(arr1000ExecTime)")
print("Avg. exec time for sum arr10000: \t\(arr10000ExecTime)")
print("\nAvg. exec time for countEvenOdd arr10: \t\t\(arr10CountExecTime)")
print("Avg. exec time for countEvenOdd arr100: \t\(arr100CountExecTime)")
print("Avg. exec time for countEvenOdd arr1000: \t\(arr1000CountExecTime)")
print("Avg. exec time for countEvenOdd arr10000: \t\(arr10000CountExecTime)")


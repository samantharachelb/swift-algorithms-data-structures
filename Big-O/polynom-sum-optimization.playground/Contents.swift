//: Quadratic Time - O(n^2)
import Foundation
import QuartzCore

// Time Formatter
public extension CFTimeInterval {
    public var formattedTime: String {
        return self >= 1000 ? String(Int(self)) + "s"
            : self >= 1 ? String(format: "%.3gs", self)
            : self >= 1e-3 ? String(format: "%.3gms", self * 1e3)
            : self >= 1e-6 ? String(format: "%.3gµs", self * 1e6)
            : self < 1e-9 ? "0s"
            : String(format: "%.3gns", self * 1e9)
    }
}

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

// Sum(n)
// sums up the first n natural numbers

func sum(_ n: UInt) -> UInt {
    var result: UInt = 0
    for i in 1...n {
        result += i
    }
    return result
}

let step = 100

var execTime: Double
for i in 1...10 {
    execTime = BenchTimer.measureBlock {
        _ = sum(UInt(i*step))
    }
    print("Avg. sum(n) exec. time for \(i*step) elements: \(execTime.formattedTime)")
}

// optimized sum(n)
// sums up the first n natural numbers using the triangular number formula
func optSum(_ n: UInt) -> UInt {
    return n * (n + 1) / 2
}

print("\nsum() vs optSum()")
var sumTime, optSumTime: Double
for i in 1...10 {
    sumTime = BenchTimer.measureBlock {
        _ = sum(UInt(i*step))
    }

    optSumTime = BenchTimer.measureBlock {
        _ = optSum(UInt(i*step))
    }
    print("- \(i*step) elements: \n\t sum(n) \t\t\t \(sumTime.formattedTime) \n\t optSum(n) \t \(optSumTime.formattedTime)")
}

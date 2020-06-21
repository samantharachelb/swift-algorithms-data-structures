//:Constant Time - O(1)

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

// Array Element Check - O(1)
func startsWithZero(array: [Int]) -> Bool {
    guard array.count != 0 else {
        return false
    }
    return array.first == 0 ? true : false
}

var smallArray = [1, 0, 0]
var smallArrExecTime = BenchTimer.measureBlock {
    _ = startsWithZero(array: smallArray)
}
print("Avg. exec time for smallArray: \(smallArrExecTime)")

var mediumArray = Array<Int>(repeating: 0, count: 10000)
var mediumArrExecTime = BenchTimer.measureBlock {
    _ = startsWithZero(array: mediumArray)
}
print("Avg. exec time for mediumArray: \(mediumArrExecTime)")


var largeArray = Array<Int>(repeating: 0, count: 1000000)
var largeArrayExecTime = BenchTimer.measureBlock {
    _ = startsWithZero(array: largeArray)
}
print("Avg. exec time for mediumArray: \(largeArrayExecTime)")



// Hashmap Lookup (Dictionary Search) - O(1)
func generateDict(size: Int) -> Dictionary<String, Int> {
    var result = Dictionary<String, Int>()
    guard size > 0 else {
        return result
    }

    for i in 0..<size {
        let key = String(i)
        result[key] = i
    }
    return result
}

let smallDict = ["one": 1, "two": 2, "three": 3]
var smallDictExecTime = BenchTimer.measureBlock {
    _ = smallDict["two"]
}
print("\nAvg. exec time for smallDict: \(smallDictExecTime)")

let mediumDict = generateDict(size: 500)
var mediumDictExecTime = BenchTimer.measureBlock {
    _ = mediumDict["420"]

}
print("Avg. exec time for mediumDict: \(mediumDictExecTime)")

let largeDict = generateDict(size: 100000)
var largeDictExecTime = BenchTimer.measureBlock {
    _ = largeDict["42069"]
}
print("Avg. exec time for largeDict: \(largeDictExecTime)")

//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Daniel Belokursky on 6.12.21.
//

import Foundation
 
func factorial(_ number: Double) -> Double {
    if number == 0{
        return 1
    }
    return number * factorial(number - 1)
}

struct CalculatorBrain {
    private var accumulator: Double?
    var description: String = ""
    var resultIsPending: Bool = false
    
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double, Double) -> Double)
        case equals
    }
    
    private var operations: Dictionary<String, Operation> = [
        "𝜋": Operation.constant(Double.pi),
        "e": Operation.constant(M_E),
        "√": Operation.unaryOperation(sqrt),
        "cos": Operation.unaryOperation(cos),
        "±": Operation.unaryOperation({-$0}),
        "×": Operation.binaryOperation({$0 * $1}),
        "÷": Operation.binaryOperation({$0 / $1}),
        "-": Operation.binaryOperation({$0 - $1}),
        "+": Operation.binaryOperation({$0 + $1}),
        "=": Operation.equals,
        "C": Operation.constant(0),
        "%": Operation.unaryOperation({$0 / 100}),
        "xⁿ": Operation.binaryOperation({pow($0, $1)}),
        "sin": Operation.unaryOperation(sin),
        "x!": Operation.unaryOperation(factorial(_:))
    ]
    
    private struct PendingBinaryOperation {
        let function: (Double, Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
    private var pendingBinaryOperation: PendingBinaryOperation?
    //TODO: OTHER CASES
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .constant(let value):
                accumulator = value
                description = ""
            case .unaryOperation(let function):
                if accumulator != nil {
                    accumulator = function(accumulator!)
                }
            case .binaryOperation(let function):
                if accumulator != nil {
                    pendingBinaryOperation = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                    accumulator = nil
                    resultIsPending = true
                    description += symbol + "..."
                }
            case .equals:
                performPendingBinaryOperation()
                if !resultIsPending {
                    description += symbol
                }
                
            }
        }
    }
    
    private mutating func performPendingBinaryOperation() {
        if pendingBinaryOperation != nil && accumulator != nil {
            accumulator = pendingBinaryOperation?.perform(with: accumulator!)
            pendingBinaryOperation = nil
            resultIsPending = false
        }
    }
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
        
        if !resultIsPending {
            description = String(accumulator!)
        } else {
            description.removeLast(3)
            description += String(accumulator!)
        }
    }
    
    var result: Double? {
        get {
            return accumulator
        }
    }
}

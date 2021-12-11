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
    private var descriptionAccumulator: String?
    var description: String? {
        get {
            if pendingBinaryOperation == nil {
                return descriptionAccumulator
            } else {
                return pendingBinaryOperation?.descriptionFunction(pendingBinaryOperation!.descriptionOperand, descriptionAccumulator ?? " ")
            }
        }
    }
    
    var resultIsPending: Bool = false
    
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double, ((String)-> String)?)
        case binaryOperation((Double, Double) -> Double, ((String, String) -> String)?)
        case equals
    }
    
    private var operations: Dictionary<String, Operation> = [
        "𝜋": Operation.constant(Double.pi),
        "e": Operation.constant(M_E),
        "√": Operation.unaryOperation(sqrt,nil),
        "cos": Operation.unaryOperation(cos,nil),
        "±": Operation.unaryOperation({-$0},nil),
        "×": Operation.binaryOperation({$0 * $1},nil),
        "÷": Operation.binaryOperation({$0 / $1},nil),
        "-": Operation.binaryOperation({$0 - $1},nil),
        "+": Operation.binaryOperation({$0 + $1},nil),
        "=": Operation.equals,
        "%": Operation.unaryOperation({$0 / 100}, {"(" + $0 + "/100" + ")"}),
        "xⁿ": Operation.binaryOperation({pow($0, $1)},{$0 + "^" + $1}),
        "sin": Operation.unaryOperation(sin,nil),
        "x!": Operation.unaryOperation(factorial(_:), {$0 + "!"})
    ]
    
    private struct PendingBinaryOperation {
        let function: (Double, Double) -> Double
        let firstOperand: Double
        let descriptionFunction: (String, String) -> String
        let descriptionOperand: String
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
        
        func performDescription(with secondOperand: String) -> String {
            return descriptionFunction(descriptionOperand, secondOperand)
        }
    }
    
    private var pendingBinaryOperation: PendingBinaryOperation?
    
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .constant(let value):
                accumulator = value
                descriptionAccumulator = symbol
            case .unaryOperation(let function, var descriptionFunction):
                if accumulator != nil {
                    accumulator = function(accumulator!)
                    if descriptionFunction == nil {
                        descriptionFunction = {symbol + "(" + $0 + ")"}
                    }
                    descriptionAccumulator = descriptionFunction!(descriptionAccumulator!)
                }
            case .binaryOperation(let function, var descriptionFunction):
                if accumulator != nil {
                    if descriptionFunction == nil {
                        descriptionFunction = {$0 + " " + symbol + " " + $1}
                    }
                    pendingBinaryOperation = PendingBinaryOperation(function: function, firstOperand: accumulator!, descriptionFunction: descriptionFunction!, descriptionOperand: descriptionAccumulator!)
                    resultIsPending = true
                    descriptionAccumulator = nil
                }
            case .equals:
                performPendingBinaryOperation()
            }
        }
    }
    
    private mutating func performPendingBinaryOperation() {
        if pendingBinaryOperation != nil && accumulator != nil {
            accumulator = pendingBinaryOperation?.perform(with: accumulator!)
            descriptionAccumulator = pendingBinaryOperation?.performDescription(with: descriptionAccumulator!)
            pendingBinaryOperation = nil
            resultIsPending = false
        }
    }
    
    mutating func clear() {
        accumulator = nil
        pendingBinaryOperation = nil
        descriptionAccumulator = " "
    }
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
        if let value = accumulator {
            descriptionAccumulator = String(value)
        }
    }
    
    var result: Double? {
        get {
            return accumulator
        }
    }
}

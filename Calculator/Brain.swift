//
//  Brain.swift
//  Calculator
//
//  Created by Balnur Sakhybekova on 10/1/19.
//  Copyright © 2019 Balnur Sakhybekova. All rights reserved.


import Foundation

//func multiply (op1 : Double, op2 : Double) -> Double {
//    return op1*op2
//}

class Brain {
    var accumulator = 0.0
    
    func setOper (operand:Double) {
        accumulator = operand
    }
    
    var Operations : Dictionary<String, operation> = [
        "e" : operation.Constant(M_E),
        "π" : operation.Constant(M_PI),
        "√" : operation.Unary(sqrt),
        "x" : operation.Binary({$0 * $1}),
        "/" : operation.Binary({$0 / $1}),
        "+" : operation.Binary({$0 + $1}),
        "=" : operation.Equals
    
    ]
    
    enum operation {
        case Constant(Double)
        case Unary((Double) -> Double)
        case Binary((Double, Double) -> Double)
        case Equals
    }
    
    func performOper (symbol:String) {
        if let operation = Operations[symbol]{
            switch operation {
            case .Constant(let value) : accumulator = value
            case .Unary(let function) : accumulator = function(accumulator)
            case .Binary(let function) :
                executeEquals()
                pending = pendingBinaryOper(binaryOper: function, firstOperand: accumulator)
            case .Equals : executeEquals()
            }
        }
    }
    
    func executeEquals(){
        if pending != nil{
            accumulator = pending!.binaryOper(pending!.firstOperand, accumulator)
            pending = nil
        }

    }
    
    var pending : pendingBinaryOper?
    
    struct pendingBinaryOper{
        var binaryOper : (Double, Double) -> Double, firstOperand : Double
    }
    
    var result:Double {
        get {
            return accumulator
        }
    }
}

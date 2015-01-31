//
//  DecimalNumbers
// ================
//
//  Enables improved, native-Swift-like behavior for BCD decimal numbers,
//  in the form of the NSDecimalNumber class, with native operators,
//  easier conversion to and from native numeric types (pre/postfix tilde ~ as operator)
//
//  This mini-library uses the type alias DecimalNumber instead of
//  NSDecimalNumber, again to yield a more native (unprefixed) feel
//  to the type.
//
//  Use cases are mostly financial applications, where absolute
//  decimal accuracy is paramount; issues with IEEE floating point
//  are well-known.
//
//  Simple use
// =============
//
//  1) Create a decimal number from another numerical type
//      let decimalNumber = ~10
//
//  2) Create a decimal number from a string containing a number
//      let decimalNumber = ~"1.1"
//
//  3) Convert a decimal number to another numerical type (Double or Int, depending on context)
//      let sum = 10.1 + decimalNumber~
//
//  4) Add two decimal numbers
//      let decimalSum = ~25 + ~"-1.56"
//      let sumAsDouble = decimalSum~
//
//  Created by David H. Christensen on 27/01/15.
//  Copyright (c) 2015 David H. Christensen. All rights reserved.
//      LICENSED WITH THE 3-CLAUSE BSD LICENSE
//
//  Comments? Write me at
//      me@davidh.info
//

import Foundation

// For more non-prefixed Swift likeness
public typealias DecimalNumber = NSDecimalNumber

// MARK: - Arithmetic
public func + (lhs: DecimalNumber, rhs: DecimalNumber) -> DecimalNumber
{ return lhs.decimalNumberByAdding(rhs) }

public func - (lhs: DecimalNumber, rhs: DecimalNumber) -> DecimalNumber
{ return lhs.decimalNumberBySubtracting(rhs) }

public func * (lhs: DecimalNumber, rhs: DecimalNumber) -> DecimalNumber
{ return lhs.decimalNumberByMultiplyingBy(rhs) }

public func / (lhs: DecimalNumber, rhs: DecimalNumber) -> DecimalNumber
{ return lhs.decimalNumberByDividingBy(rhs) }

infix operator ** {}
public func ** (lhs: DecimalNumber, rhs: DecimalNumber) -> DecimalNumber
{ return lhs.decimalNumberByRaisingToPower(rhs.integerValue) }

public func += (inout lhs: DecimalNumber, rhs: DecimalNumber)
{ lhs = lhs + rhs }

public func -= (inout lhs: DecimalNumber, rhs: DecimalNumber)
{ lhs = lhs - rhs }

public func *= (inout lhs: DecimalNumber, rhs: DecimalNumber)
{ lhs = lhs * rhs }

public func /= (inout lhs: DecimalNumber, rhs: DecimalNumber)
{ lhs = lhs / rhs }

// MARK: - Comparison operators
public func < (lhs: DecimalNumber, rhs: DecimalNumber) -> Bool
{ return lhs.doubleValue < rhs.doubleValue }

public func > (lhs: DecimalNumber, rhs: DecimalNumber) -> Bool
{ return lhs.doubleValue > rhs.doubleValue }

public func == (lhs: DecimalNumber, rhs: DecimalNumber) -> Bool
{ return lhs.doubleValue == rhs.doubleValue }

// MARK: - Convert to decimal number
prefix operator ~ {}
public prefix func ~ (value: Double) -> DecimalNumber
{ return DecimalNumber(double: value) }
public prefix func ~ (value: Int) -> DecimalNumber
{ return DecimalNumber(integer: value) }
public prefix func ~ (value: Float) -> DecimalNumber
{ return DecimalNumber(float: value) }
public prefix func ~ (value: UInt) -> DecimalNumber
{ return DecimalNumber(unsignedLong: value) }
public prefix func ~ (value: UInt32) -> DecimalNumber
{ return DecimalNumber(unsignedInt: value) }
public prefix func ~ (value: Int32) -> DecimalNumber
{ return DecimalNumber(int: value) }
public prefix func ~ (value: UInt16) -> DecimalNumber
{ return DecimalNumber(unsignedShort: value) }
public prefix func ~ (value: Int16) -> DecimalNumber
{ return DecimalNumber(short: value) }
public prefix func ~ (value: UInt8) -> DecimalNumber
{ return DecimalNumber(unsignedChar: value) }
public prefix func ~ (value: Int8) -> DecimalNumber
{ return DecimalNumber(char: value) }
public prefix func ~ (value: NSNumber) -> DecimalNumber
{ return DecimalNumber(string: value.stringValue) }
public prefix func ~ (value: String) -> DecimalNumber
{ return DecimalNumber(string: value) }

public func decimalize(value: Double) -> DecimalNumber
{ return ~value }

// MARK: - Convert from decimal number
postfix operator ~ {}
public postfix func ~ (value: DecimalNumber) -> Double
{ return value.doubleValue }
public postfix func ~ (value: DecimalNumber) -> Int
{ return value.integerValue }
public func undecimalize(value: DecimalNumber) -> Double
{ return value.doubleValue }

// MARK: - Logarithmic functions
public func logD(value: DecimalNumber) -> DecimalNumber
{ return ~log(value~) }

public func log10D(value: DecimalNumber) -> DecimalNumber
{ return ~log10(value~) }

public func log2D(value: DecimalNumber) -> DecimalNumber
{ return ~log2(value~) }

// MARK:- Trigonometric functions
public func sinD(value: DecimalNumber) -> DecimalNumber
{ return ~sin(value~) }

public func cosD(value: DecimalNumber) -> DecimalNumber
{ return ~cos(value~) }

public func tanD(value: DecimalNumber) -> DecimalNumber
{ return ~tan(value~) }

public func asinD(value: DecimalNumber) -> DecimalNumber
{ return ~asin(value~) }


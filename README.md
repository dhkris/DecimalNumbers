# DecimalNumbers
Native decimal number support for Swift
<hr>
Enables improved, native-Swift-like behavior for BCD decimal numbers,
in the form of the NSDecimalNumber class, with native operators,
easier conversion to and from native numeric types (pre/postfix tilde ~ as operator)

This mini-library uses the type alias DecimalNumber instead of
NSDecimalNumber, again to yield a more native (unprefixed) feel
to the type.

Use cases are mostly financial applications, where absolute
decimal accuracy is paramount; issues with IEEE floating point
are well-known.

##Simple use
<hr>

1) Create a decimal number from another numerical type
<pre>    let decimalNumber = ~10</pre>

2) Create a decimal number from a string containing a number
<pre>    let decimalNumber = ~"1.1"</pre>

3) Convert a decimal number to another numerical type (Double or Int, depending on context)
<pre>    let sum = 10.1 + decimalNumber~</pre>

4) Add two decimal numbers
<pre>    let decimalSum = ~25 + ~"-1.56"
    let sumAsDouble = decimalSum~</pre>

    LICENSED WITH THE 3-CLAUSE BSD LICENSE

Comments? Write me at
    me@davidh.info

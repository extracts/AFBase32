AFBase32
========

An implementation of [Douglas Crockford][dc-website]'s Base32 encoding in Objective-C. See [http://www.crockford.com/wrmg/base32.html][dc-base32-encoding] for more information.

*Note*: This library should not be mistaken for the [RFC4648][rfc4648] data encoding specifications.

**IMPORTANT NOTE**: This library can only encode decimal values with 19 or *less* digits. This limitation is there to prevent any of the underlaying primitive data structures from overflowing.

[dc-website]: http://www.crockford.com "Douglas Crockford's Wrrld Wide Web"
[dc-base32-encoding]: http://www.crockford.com/wrmg/base32.html "Base32 Encoding"
[rfc4648]: http://tools.ietf.org/html/rfc4648 "The Base16, Base32, and Base64 Data Encodings"
[openssl-website]: http://www.openssl.org "OpenSSL: The Open Source toolkit for SSL/TLS"
[openssl-docs-bignum]: http://www.openssl.org/docs/crypto/bn.html#NAME "OpenSSL: Documents, bn(3)"

OS Compatibility
----------------
- The actual library (`AFBase32.h` and `AFBase32.m`) should be usable on iOS 4 or later, or OS X v10.7 or later. Since NSRegularExpression ([iOS][apple-doc-nsregularexpression-ios], [OS X][apple-doc-nsregularexpression-osx]) is used for encoding, iOS 4 or OS X v10.7 is required.
- The demo project requires iOS 7.1 or higher.

[apple-doc-nsregularexpression-ios]: https://developer.apple.com/library/ios/#documentation/Foundation/Reference/NSRegularExpression_Class/Reference/Reference.html#//apple_ref/doc/uid/TP40009708 "NSRegularExpression Class Reference (iOS)"
[apple-doc-nsregularexpression-osx]: https://developer.apple.com/library/mac/#documentation/Foundation/Reference/NSRegularExpression_Class/Reference/Reference.html#//apple_ref/doc/uid/TP40009708 "NSRegularExpression Class Reference (OS X)"


ARC Compatibility
-----------------
AFBase32 can automatically detect whether your project is using [ARC][clang-docs-arc], and generate the correct code using conditional compilation. Therefore, it will work regardless of your project's ARC settings.

[clang-docs-arc]: http://clang.llvm.org/docs/AutomaticReferenceCounting.html "Objective-C Automatic Referencing Counting (ARC)"

Dependencies
------------
None.

Installation
------------
To use the AFBase32 class and the corresponding AFBase32Crockford NSString category in your project, just drag the header and implementation files (`AFBase32.h` and `AFBase32.m`) into your project and import the header file into any class where you wish to use the Base32 functionality.

Usage
-----
To encode a number, for example '1234':

	NSLog(@"%@", [AFBase32 encode:@"1234"]);
	
which will yield:
	
	16J

To decode a Base32 string, for example '14SC0PJ'

	NSLog(@"%@", [AFBase32 decode:@"14SC0PJ"]);

which will yield:

	1234567890


NSString Extensions
-------------------
AFBase32 extends [NSString][apple-doc-nsstring] with the `AFBase32Crockford` category and two utility methods.

For encoding a string representation of a decimal number to Base32:

	- (NSString *)base32EncodedString;

For example:

	NSLog(@"%@", [@"1234" base32EncodedString]);

will give you:

	16J

For decoding a Base32 string into its original decimal value:

	- (NSString *)decodeBase32String;


For example:

	NSLog(@"%@", [@"14SC0PJ" decodeBase32String]);

will give you:

	1234567890

[apple-doc-nsstring]: https://developer.apple.com/library/ios/#documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html#//apple_ref/doc/uid/TP40003744 "NSString Class Reference"

Demo Project
------------
The demo project comes with an iOS app that can be used as a rudimentary encoder/decoder. There is a UI for entering decimal numbers and encoding and decoding strings. There are also four small tests -- two encoding and two decoding -- that demonstrate the usage of the library.

Note that the demo project requires iOS 7.1 or above. The actual library should be usable on iOS 4 or later, or OS X v10.7 or later.

License
-------
	MIT License (MIT)

	Copyright (c) 2015 Ashkan Farhadtouski

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
	FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
	IN THE SOFTWARE.

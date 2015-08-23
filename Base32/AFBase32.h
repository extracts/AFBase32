/*
 * AFBase32.h
 *
 * MIT License (MIT)
 *
 * Copyright (c) 2015 Ashkan Farhadtouski
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 * IN THE SOFTWARE.
 */

/*
 * Release History
 *
 * Version 1.0 (12/29/2012)
 * ------------------------
 * - Initial release.
 *
 * Version 1.1 (08/23/2015)
 * ------------------------
 * - Fix a bug in decimal to binary conversion.
 * - Fix a bug in character lookup where an invalid index would return a garbage value.
 * - Renamed the Base32 class to AFBase32 to avoid potential naming conflicts.
 * - Increased the maximum limit to 19.
 * - Convert the inline testes to proper XCTesting test cases.
 * - Fixed a new inconsistent method return types.
 * - Update the rest of the code to the latest coding/configuration practices.
 */

#import <Foundation/Foundation.h>

/**
 * Maximum number of digits allowed in a number for encoding.
 */
extern NSInteger const kAFBase32DigitLimit;

@interface NSString (AFBase32Crockford)

/**
 * Convert the decimal number represented by the current string instance to its Base32 
 * representation. The Base32 encoding used is the variant proposed by Douglas Crockford as 
 * described at http://www.crockford.com/wrmg/base32.html
 *
 * Note that the decimal number must have *at most* @c kAFBase32DigitLimit digits. Otherwise the
 * primitive data structures will overflow.
 *
 * @return The Base32 representation of the current string.
 *
 * @see decodeBase32String
 * @see [AFBase32 encode:]
 *
 * @since 1.0
 */
- (NSString *)base32EncodedString;

/**
 * Decodes the Base32 string represented by the current instance to its original decimal value.
 *
 * @return A string representation of the original decimal value.
 *
 * @see base32EncodedString
 * @see [AFBase32 decode:]
 *
 * @since 1.0
 */
- (NSString *)decodeBase32String;

@end

/**
 * Provides encoding/decoding of decimal values into Base32 format. This format is defined by 
 * Douglas Crockford at http://www.crockford.com/wrmg/base32.html
 */
@interface AFBase32 : NSObject

/**
 * Encodes @c numberToEncode into its Base32 representation.
 *
 * @param numberToEncode A string representation of a decimal number. Note that  the decimal number 
 *                       *must* have ten or *less* digits. Otherwise the primitive data structures 
 *                       will overflow.
 *
 * @return Base32 representation of the decimal value in @c numberToEncode.
 *
 * @see decode:
 *
 * @since 1.0
 */
+ (NSString *)encode:(NSString *)numberToEncode;

/**
 * Decodes @c base32String into its original, decimal value.
 *
 * @param base32String A Base32 string representation that should be decoded into its original, 
 *                     decimal value.
 *
 * @return The original decimal value.
 *
 * @see encode:
 *
 * @since 1.0
 */
+ (NSString *)decode:(NSString *)base32String;

@end

/*
 * base32Test.m
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

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "AFBase32.h"

@interface base32Tests : XCTestCase

@end

@implementation base32Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the
    // class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in
    // the class.
    [super tearDown];
}

- (void)testEncodingUsingClassMethods
{
    // Predefined values
    NSString *stringToEncode = @"1234";
    NSString *correctEncoding = @"16J";
    
    // Encode using the class method
    NSString *result = [AFBase32 encode:stringToEncode];
    
    XCTAssertEqualObjects(correctEncoding, result);
}

- (void)testEncodingUsingCategoryMethods
{
    // Predefined values
    NSString *stringToEncode = @"1234567890";
    NSString *correctEncoding = @"14SC0PJ";
    
    // Encoding using the NSString category method
    NSString *result = [stringToEncode base32EncodedString];
    
    XCTAssertEqualObjects(correctEncoding, result);
}

- (void)testDecodingUsingClassMethods
{
    NSString *stringToDecode = @"16J";
    NSString *correctDecoding = @"1234";
    
    // Decode the string using the class method
    NSString *result = [AFBase32 decode:stringToDecode];
    
    XCTAssertEqualObjects(correctDecoding, result);
}

- (void)testDecodingUsingCategoryMethods
{
    NSString *stringToDecode = @"14SC0PJ";
    NSString *correctDecoding = @"1234567890";
    
    // Decode using the NSString utility method
    NSString *result = [stringToDecode decodeBase32String];
    
    XCTAssertEqualObjects(correctDecoding, result);
}

@end

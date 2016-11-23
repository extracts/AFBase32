/*
 * ViewController.m
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

#import "ViewController.h"

#import "AFBase32.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *numberToEncodeTextField;
@property (weak, nonatomic) IBOutlet UITextView *stringToDecodeTextView;
@property (weak, nonatomic) IBOutlet UITextView *decodedNumberTextView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI Actions

- (IBAction)encodeButtonTouchUpInside
{
    self.stringToDecodeTextView.text = [AFBase32 encode:self.numberToEncodeTextField.text];//] base32EncodedString];
    [self.numberToEncodeTextField resignFirstResponder];
}

- (IBAction)decodeButtonTouchUpInside
{
    self.decodedNumberTextView.text = [self.stringToDecodeTextView.text decodeBase32String];
    [self.stringToDecodeTextView resignFirstResponder];
}

#pragma mark - UITextViewDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.text.length + string.length <= kAFBase32DigitLimit)
    {
        return YES;
    }
    
    return NO;
}

@end

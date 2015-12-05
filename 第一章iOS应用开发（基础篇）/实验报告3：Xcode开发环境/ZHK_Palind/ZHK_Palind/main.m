//
//  main.m
//  ZHK_Palind
//
//  Created by 祝海焜 on 15/12/5.
//  Copyright © 2015年 Matin.Zhou. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Declare Variables
        //cString is a string of 100 characters (technically an array of 100 characters)
        char g8String[100];
        
        NSString *myg8String;
        //Get the string form the user
        NSLog(@"Enter a string...");
        scanf("%s",g8String);
        //Convert to NSString
        myg8String = [NSString stringWithCString: g8String encoding: NSASCIIStringEncoding];
        //Log Result
        NSLog(@"You entered: %@", myg8String);
        // Palindrome////////////////////
        NSMutableArray *logicalCharacters = [NSMutableArray array];
        [myg8String enumerateSubstringsInRange:(NSRange){0, [myg8String length]}
                                       options:NSStringEnumerationByComposedCharacterSequences
                                    usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop)
         {
             [logicalCharacters addObject:substring];
         }];
        NSUInteger count = [logicalCharacters count];
        BOOL isPalindrome = YES;
        for (NSUInteger idx = 0; idx < count / 2; ++idx) {
            NSString *a = logicalCharacters[idx];
            NSString *b = logicalCharacters[count - idx - 1];
            if ([a localizedCaseInsensitiveCompare:b] != NSOrderedSame) {
                isPalindrome = NO;
                break;
            } }
        NSLog(@"Given String isPalindrome: %d", isPalindrome);
        return 0;
        }
    return 0;
}
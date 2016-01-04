#import<Foundation/Foundation.h>
int main()
{
    //Declaring the Char Variable
    char *testString;
    
    //For user input
    scanf("%s", testString);
    
    NSString *lastname = [NSString stringWithUTF8String:testString];
    
    //To Print
    NSLog(@"lastname= %@",lastname);
    
    NSMutableArray *logicalCharacters = [NSMutableArray array];
    [lastname enumerateSubstringsInRange:(NSRange){0, [lastname length]}
                                 options:NSStringEnumerationByComposedCharacterSequences
                              usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop)
     {
         [logicalCharacters addObject:substring];
     }
     ];
    
    NSUInteger count = [logicalCharacters count];
    BOOL isPalindrome = YES;
    for (NSUInteger idx = 0; idx < count / 2; ++idx) {
        NSString *a = logicalCharacters[idx];
        NSString *b = logicalCharacters[count - idx - 1];
        if ([a localizedCaseInsensitiveCompare:b] != NSOrderedSame) {
            isPalindrome = NO;
            break; }
    }
    NSLog(@"isPalindrome: %d", isPalindrome);
    return 0;
}

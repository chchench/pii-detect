//
//  pii-detect.m
//  pii-detect
//
//  Created by Charles Cheng on 2/15/22.
//

#import <Foundation/Foundation.h>
#import "pii-detect.h"



@implementation DetectedSensitiveData

@synthesize detectedValue = _detectedValue;
@synthesize location = _location;

@end



@implementation PIIDetect


+ (NSArray*)findCCData:(NSString*)content
{
    NSError *error = NULL;
     
    // Currently only VISA/Mastercard/AMEX are supported.
    
    NSString *inputPattern = @"(4[0-9]{3}[\\s-]*[0-9]{4}[\\s-]*[0-9]{4}[\\s-]*[0-9]{4})|"
    "(5[1-5][0-9]{2}[\\s-]*[0-9]{4}[\\s-]*[0-9]{4}[\\s-]*[0-9]{4})|"
    "(3[47][0-9]{2}[\\s-]*[0-9]{6}[\\s-]*[0-9]{5})";
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:inputPattern
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    
    NSMutableArray *list = [[NSMutableArray alloc] init];
    
    NSArray *results = [regex matchesInString:content options:0 range:NSMakeRange(0, [content length])];
    
    if (results) {
        for (NSTextCheckingResult *match in results) {
            NSRange r = [match range];
            NSString *val = [content substringWithRange:r];
            
            NSLog(@"CREDIT CARD matched string = \"%@\"\n", val);
            
            DetectedSensitiveData *d = [[DetectedSensitiveData alloc] init];
            d.detectedValue = val;
            d.location = r;
            
            [list addObject:d];        }
    }
    
    NSLog(@"Number of new CC matches = %lu\n", list.count);
    
    return (list);
}


+ (NSArray*)findSSNData:(NSString*)content
{
    NSError *error = NULL;
    
    /*
     The valid SSN (Social Security Number) must satisfy the following conditions:
     - It should have 9 digits.
     - It should be divided into 3 parts by hyphen (-).
     - The first part should have 3 digits and should not be 000, 666, or between 900 and 999.
     - The second part should have 2 digits and it should be from 01 to 99.
     - The third part should have 4 digits and it should be from 0001 to 9999.
     */
    
    NSString *inputPattern = @"(?!666|000|9\\d{2})\\d{3}-(?!00)\\d{2}-(?!0{4})\\d{4}|XXX-XX-\\d{4}";
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:inputPattern options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSMutableArray *list = [[NSMutableArray alloc] init];
    
    NSArray *results = [regex matchesInString:content options:0 range:NSMakeRange(0, [content length])];
    
    if (results) {
        for (NSTextCheckingResult *match in results) {
            NSRange r = [match range];
            NSString *val = [content substringWithRange:r];
            
            NSLog(@"SSN matched string = \"%@\"\n", val);
            
            DetectedSensitiveData *d = [[DetectedSensitiveData alloc] init];
            d.detectedValue = val;
            d.location = r;
            
            [list addObject:d];
        }
    }
    
    NSLog(@"Number of new SSN matches = %lu\n", list.count);
    
    return (list);
}


@end


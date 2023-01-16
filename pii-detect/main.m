//
//  main.m
//  pii-detect
//
//  Created by Charles Cheng on 2/15/22.
//

#import <Foundation/Foundation.h>
#import "pii-detect.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        NSArray *detectedCCs =
            [PIIDetect findCCData:@"4010 2000 1002 3777 4010-2000-1002-3777 408-111-2222  3710 873022 92122"];
        NSLog(@"Detected %tu credit card numbers", detectedCCs.count);
        
        NSArray *detectedSSNs =
            [PIIDetect findSSNData:@"blah blah 123-32-1899 divider 190-31-1100"];
        NSLog(@"Detected %tu Social Security Numbers", detectedSSNs.count);

    }
    return 0;
}

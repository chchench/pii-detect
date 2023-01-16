//
//  pii-detect.h
//  pii-detect
//
//  Created by Charles Cheng on 2/15/22.
//

#ifndef pii_detect_h
#define pii_detect_h


@interface PIIDetect : NSObject

+ (NSArray*)findCCData:(NSString*)content;
+ (NSArray*)findSSNData:(NSString*)content;

@end


@interface DetectedSensitiveData : NSObject {
    
    NSString *_filepath;
    NSString *_detectedValue;
    NSRange _location;
}

@property (nonatomic, copy) NSString *filepath;
@property (nonatomic, copy) NSString *detectedValue;
@property NSRange location;

@end


#endif /* pii_detect_h */

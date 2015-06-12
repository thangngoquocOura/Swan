//
//  Foo.h
//  Swan
//
//  Created by Antti Laitala on 23/04/15.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SwanHashFunction) {
    SwanHashFunctionMD2,
    SwanHashFunctionMD4,
    SwanHashFunctionMD5,
    SwanHashFunctionSHA1,
    SwanHashFunctionSHA224,
    SwanHashFunctionSHA256,
    SwanHashFunctionSHA384,
    SwanHashFunctionSHA512
};

@interface NSString (Swan)

- (NSString * __nonnull)digestUsingHashFunction:(SwanHashFunction)hashFunction;

@end

//
//  Foo.m
//  Swan
//
//  Created by Antti Laitala on 23/04/15.
//
//

#import "NSString+Swan.h"

#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (Swan)

- (NSString *)digestUsingHashFunction:(SwanHashFunction)hashFunction
{
    NSUInteger digestLength = 0;
    unsigned char *(*hashFunctionPtr)(const void *data, CC_LONG len, unsigned char *md);
    switch (hashFunction) {
        case SwanHashFunctionMD2:
            digestLength = CC_MD2_DIGEST_LENGTH;
            hashFunctionPtr = CC_MD2;
            break;
        case SwanHashFunctionMD4:
            digestLength = CC_MD4_DIGEST_LENGTH;
            hashFunctionPtr = CC_MD4;
            break;
        case SwanHashFunctionMD5:
            digestLength = CC_MD5_DIGEST_LENGTH;
            hashFunctionPtr = CC_MD5;
            break;
        case SwanHashFunctionSHA1:
            digestLength = CC_SHA1_DIGEST_LENGTH;
            hashFunctionPtr = CC_SHA1;
            break;
        case SwanHashFunctionSHA224:
            digestLength = CC_SHA224_DIGEST_LENGTH;
            hashFunctionPtr = CC_SHA224;
            break;
        case SwanHashFunctionSHA256:
            digestLength = CC_SHA256_DIGEST_LENGTH;
            hashFunctionPtr = CC_SHA256;
            break;
        case SwanHashFunctionSHA384:
            digestLength = CC_SHA384_DIGEST_LENGTH;
            hashFunctionPtr = CC_SHA384;
            break;
        case SwanHashFunctionSHA512:
            digestLength = CC_SHA512_DIGEST_LENGTH;
            hashFunctionPtr = CC_SHA512;
            break;
        default:
            return nil;
    }
    
    unsigned char digest[digestLength];
    const char *bytes = self.UTF8String;
    hashFunctionPtr(bytes, (CC_LONG)strlen(bytes), digest);
    
    NSMutableString *result = [NSMutableString stringWithCapacity:digestLength * 2];
    for (NSUInteger i = 0; i < digestLength; ++i)
        [result appendFormat:@"%02x", digest[i]];
    return result;
}

@end

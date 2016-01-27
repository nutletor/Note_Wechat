//
//  NSString+MD5.m
//  Note_Wechat
//
//  Created by THN-Huangfei on 16/1/27.
//  Copyright © 2016年 Huangfei. All rights reserved.
//

#import "NSString+MD5.h"

#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MD5)

+ (NSString *)getMd5_32Bit_String:(NSString *)srcString
{
    const char *cStr = [srcString UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [result appendFormat:@"%02x", digest[i]];
    
    return result;
}

@end

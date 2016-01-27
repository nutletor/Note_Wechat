//
//  NSString+MD5.h
//  Note_Wechat
//
//  Created by THN-Huangfei on 16/1/27.
//  Copyright © 2016年 Huangfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)

+ (NSString *)getMd5_32Bit_String:(NSString *)srcString;

@end

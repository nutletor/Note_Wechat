//
//  WXApiManager.m
//  Note_Wechat
//
//  Created by THN-Huangfei on 16/1/27.
//  Copyright © 2016年 Huangfei. All rights reserved.
//

#import "WXApiManager.h"

@implementation WXApiManager

#pragma mark - LifeCycle
+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static WXApiManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[WXApiManager alloc] init];
    });
    return instance;
}

#pragma mark - WXApiDelegate
- (void)onResp:(BaseResp *)resp
{
    if([resp isKindOfClass:[PayResp class]]){
        if (_delegate && [_delegate respondsToSelector:@selector(managerDidRecvPayResponse:)]) {
            PayResp * payResp = (PayResp *)resp;
            [_delegate managerDidRecvPayResponse:payResp];
        }
    }
}

- (void)onReq:(BaseReq *)req
{
    
}

@end

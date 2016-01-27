//
//  WXApiManager.h
//  Note_Wechat
//
//  Created by THN-Huangfei on 16/1/27.
//  Copyright © 2016年 Huangfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXApi.h"

@protocol WXApiManagerDelegate <NSObject>

@optional
- (void)managerDidRecvPayResponse:(PayResp *)response;

@end

@interface WXApiManager : NSObject<WXApiDelegate>

@property (nonatomic, assign) id<WXApiManagerDelegate> delegate;

+ (instancetype)sharedManager;

@end

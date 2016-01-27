//
//  ViewController.m
//  Note_Wechat
//
//  Created by THN-Huangfei on 16/1/18.
//  Copyright © 2016年 Huangfei. All rights reserved.
//

#import "ViewController.h"

#import "WXApiManager.h"
#import "WXSignParams.h"

@interface ViewController ()<WXApiManagerDelegate>

- (IBAction)loginBtnAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginBtnAction:(id)sender {
    
    //请求服务器获取预付订单信息
    NSData * data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"OrderInfo" ofType:@"json"]];
    NSDictionary * result = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSDictionary * dataDic = [result objectForKey:@"data"];
    PayReq * payReq = [[PayReq alloc] init];
    payReq.partnerId = [dataDic objectForKey:@"partner_id"];
    payReq.prepayId= [dataDic objectForKey:@"prepay_id"];
    payReq.package = @"Sign=WXPay";
    payReq.nonceStr= [dataDic objectForKey:@"nonce_str"];
    payReq.timeStamp= [[dataDic objectForKey:@"time_stamp"] intValue];
    
    //将参数再次签名，向微信客户端发起支付
    WXSignParams * signParam = [[WXSignParams alloc] initWithDictionary:dataDic];
    payReq.sign= [signParam sign];
    
    //添加支付完成回调代理
    [WXApiManager sharedManager].delegate = self;

    [WXApi sendReq:payReq];
}

#pragma mark - WXApiManagerDelegate
- (void)managerDidRecvPayResponse:(PayResp *)response
{
    //支付返回结果，实际支付结果需要去微信服务器端查询
    switch (response.errCode) {
        case WXSuccess://支付成功
        {
            //to do 请求服务器验证支付状态
        }
            break;
        case WXErrCodeUserCancel://用户取消支付
            break;
        default:
            break;
    }
}

@end

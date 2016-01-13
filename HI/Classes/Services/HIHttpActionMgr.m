//
//  HIHttpActionMgr.m
//  HI
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "HIHttpActionMgr.h"

@interface HIHttpActionMgr ()

@property (nonatomic,strong)AFHTTPSessionManager *httpRequestMgr;

@end

static HIHttpActionMgr *shareMgr = nil;


@implementation HIHttpActionMgr

- (NSString *)getBaseUrlString{
    NSString *host = nil;
    
#if defined(BOX_DEVELOPMENT)
    host = @"http://192.168.1.1";
#elif defined(BOX_UAT)
    host = @"http://baidu.com";
#elif defined(BOX_PRODUCTION)
    host = @"";
#endif
    return host;
}

+(id)shared{
    
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        shareMgr = [[HIHttpActionMgr alloc]init];
        
        NSURL *base_url = [NSURL URLWithString:[shareMgr getBaseUrlString]];
        AFHTTPSessionManager *manager =[[AFHTTPSessionManager alloc]initWithBaseURL:base_url];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        shareMgr.httpRequestMgr = manager;
        
    });
    return shareMgr;
}
- (AFHTTPSessionManager *)getHttpRequestMgr{
    shareMgr.httpRequestMgr.securityPolicy.allowInvalidCertificates = NO;
    return shareMgr.httpRequestMgr;
}

- (AFHTTPSessionManager *)getHttpsRequestMgr{
    shareMgr.httpRequestMgr.securityPolicy.allowInvalidCertificates = NO;
    return shareMgr.httpRequestMgr;
}
-(void) ClearCookies
{
    NSURL * base_url = [NSURL URLWithString:[shareMgr getBaseUrlString]];
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL: base_url];
    for (NSHTTPCookie *cookie in cookies)
    {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
    }
}
@end

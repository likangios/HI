//
//  HIActionBase.m
//  HI
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import "HIActionBase.h"

@interface HIActionBase ()

@property (nonatomic,strong) NSString *url;

@end


@implementation HIActionBase


- (id)initWithActionURLString:(NSString *)str_url{
    self = [super init];
    if (self) {
        self.url = str_url;
        self.isValid = NO;
    }
    return self;
}
- (NSString *)get_action_url{
    return  self.url;
}

- (BOOL)DoActionWithSuccess:(ActionSuccessBlock)success Failure:(ActionFailureBlock)failure{
    
    return NO;
    
}

@end

@implementation HIActionGetBase

-(BOOL)DoActionWithSuccess:(ActionSuccessBlock)success Failure:(ActionFailureBlock)failure{
    AFHTTPSessionManager *manager = [[HIHttpActionMgr shared] getHttpRequestMgr];
    if (!manager) {
        return NO;
    }
    [manager GET:self.url parameters:self.parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask *  task, id   responseObject) {
        success(self,responseObject,task);
    } failure:^(NSURLSessionDataTask *  task, NSError *  error) {
        failure(self,error,task);
    }];
    return YES;
}

@end
@implementation HIActionPostBase


-(BOOL)DoActionWithSuccess:(ActionSuccessBlock)success Failure:(ActionFailureBlock)failure
{
    AFHTTPSessionManager *manager = [[HIHttpActionMgr shared] getHttpRequestMgr];
    
    if (!manager) {
        return NO;
    }
    [manager POST:self.url parameters:self.parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(self,responseObject,task);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(self,error,task);
    }];
    
    return YES;
}

@end

@implementation HIActionDeleteBase

-(BOOL)DoActionWithSuccess:(ActionSuccessBlock)success Failure:(ActionFailureBlock)failure{
    AFHTTPSessionManager *manager = [[HIHttpActionMgr shared] getHttpRequestMgr];
    
    if (!manager) {
        return NO;
    }
    [manager DELETE:self.url parameters:self.parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(self,responseObject,task);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(self,error,task);
        
        
    }];
    
    return YES;
}

@end



















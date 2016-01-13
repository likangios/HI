//
//  HIActionBase.h
//  HI
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HIHttpActionMgr.h"
#import "HIResponeResult.h"
@class HIActionBase;

typedef void(^ActionSuccessBlock)(HIActionBase *action,id responseObject,NSURLSessionDataTask *operation);
typedef void(^ActionFailureBlock)(HIActionBase *action,NSError *error,NSURLSessionDataTask *operation);

@interface HIActionBase : NSObject

@property (nonatomic,strong)NSMutableDictionary *parameters;

@property (nonatomic,assign)    BOOL    isValid;

- (id)initWithActionURLString:(NSString *)str_url;

- (NSString *)get_action_url;

- (BOOL)DoActionWithSuccess:(ActionSuccessBlock)success Failure:(ActionFailureBlock)failure;

@end

@interface HIActionGetBase : HIActionBase

@end

@interface HIActionPostBase : HIActionBase

@end

@interface HIActionDeleteBase : HIActionBase

@end

//
//  HIStoreService.h
//  HI
//
//  Created by FengLing on 16/1/13.
//  Copyright © 2016年 lk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HIStoreService : NSObject
+ (instancetype)sharedStoreService;
- (BOOL)saveAccount:(NSString *)account  Password:(NSString *)password;
- (BOOL)updtePassword:(NSString *)pwd;
- (NSString *)Account;
- (NSString *)Password;
- (void)removeAccount;
- (void)removePassword;
- (void)removeAccountAndPassword;

@end

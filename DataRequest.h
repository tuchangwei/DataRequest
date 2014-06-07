//
//  LoginRequest.h
//  OA
//
//  Created by Leelen-mac1 on 14-4-11.
//  Copyright (c) 2014年 Leelen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataRequest : NSObject

+ (void)requestWithUrl:(NSString *)urlStr withParams:(NSDictionary *)params CallBack:(void(^)(id responseObject, NSError *error))callback;
+ (void)postRequestWithUrl:(NSString *)urlStr withParams:(NSDictionary *)params CallBack:(void(^)(id responseObject, NSError *error))callback;

@end

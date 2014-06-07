//
//  LoginRequest.m
//  OA
//
//  Created by Leelen-mac1 on 14-4-11.
//  Copyright (c) 2014年 Leelen. All rights reserved.
//

#import "DataRequest.h"
#import "AFNetworking.h"
@implementation DataRequest

+ (void)requestWithUrl:(NSString *)urlStr withParams:(NSDictionary *)params CallBack:(void(^)(id responseObject, NSError *error))callback
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    [requestSerializer setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-type"];
    requestSerializer.timeoutInterval = 10;
    manager.requestSerializer = requestSerializer;
    
    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
    responseSerializer.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"application/xml", @"text/xml", nil];
    manager.responseSerializer = responseSerializer;

    [manager GET:urlStr parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        callback(responseObject,nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"network error:%@",error);
        callback(nil,error);
    }];
    
}

+ (void)postRequestWithUrl:(NSString *)urlStr withParams:(NSDictionary *)params CallBack:(void(^)(id responseObject, NSError *error))callback
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    [requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-type"];
    requestSerializer.timeoutInterval = 10;
    manager.requestSerializer = requestSerializer;
    
    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
    responseSerializer.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"charset=utf-8", @"text/xml", nil];
    manager.responseSerializer = responseSerializer;
    [manager POST:urlStr parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        callback(responseObject,nil);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"network error:%@",error);
        callback(nil,error);
    }];

}

@end

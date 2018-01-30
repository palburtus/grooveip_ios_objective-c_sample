//
//  ApiDataManager.m
//  sdk
//
//  Created by Bhatia, Neeraj (Nick) on 1/30/18.
//  Copyright © 2018 SNRB Labs LLC. All rights reserved.
//

#import "ApiDataManager.h"

@implementation ApiDataManager


+ (ApiDataManager*)shared{
    static ApiDataManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[ApiDataManager alloc] init];
    });
    return sharedManager;
}

/**
 jsonData is a dictionary of key/values that is used for the post
 url needs to be replaced with the url we're trying to load OR if we want this method to be generic for all posts
 we need to change the method to -(void) postDataToServer:(NSDictionary *)jsonData forUrl:(NSString *) url and use the url to create the NSURL
 **/
-(void)postDataToServer:(NSDictionary*)jsonData
{
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:nil delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:@"https://temp"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSData *postData = [NSJSONSerialization dataWithJSONObject:jsonData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
    }];
    
    [postDataTask resume];
}

@end


//
//  ApiDataManager.h
//  sdk
//
//  Created by Bhatia, Neeraj (Nick) on 1/30/18.
//  Copyright © 2018 SNRB Labs LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiDataManager : NSObject

+ (ApiDataManager*)shared;
-(void)postDataToServer:(NSDictionary*) jsonData;

@end


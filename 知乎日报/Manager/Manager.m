//
//  Manager.m
//  知乎日报
//
//  Created by 付闯 on 2023/10/16.
//

#import "Manager.h"
#import <AFNetworking/AFNetworking.h>
#import <JSONModel/JSONModel.h>
#import "ContentsModel.h"
#import "story_extralModel.h"
#import "ReviewsView.h"
#import "LongReviewsModel.h"
static Manager* manager  = nil;
@implementation Manager
+ (instancetype) shareManager {
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [[Manager alloc] init];
        });
    }
    return manager;
}
- (void)makeData:(TestSucceedBlock)succeedBlock error:(EorrorBlock)errorBlock {
    
    NSString* urlString = @"https://news-at.zhihu.com/api/4/news/latest";
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        ContentsModel* JsonModelX = [[ContentsModel alloc] initWithDictionary:responseObject error:nil];
        succeedBlock(JsonModelX);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}

- (void)makeData2:(QuestBeforeBlock)succeedBlock error:(EorrorBlock)errorBlock andLastDate:(NSString *)lastDate {
    NSString* urlString = [NSString stringWithFormat:@"https://news-at.zhihu.com/api/4/news/before/%@", lastDate];
    
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        ContentsModel* JsonModelX = [[ContentsModel alloc] initWithDictionary:responseObject error:nil];
        succeedBlock(JsonModelX);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}
    

- (void) makeData3:(QuestextraBlock)succeedBlock error:(EorrorBlock)errorBlock andid:(NSString *)idString {
    
    NSString* urlString = [NSString stringWithFormat:@"https://news-at.zhihu.com/api/4/story-extra/%@", idString];
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        story_extralModel* JsonModelX = [[story_extralModel alloc] initWithDictionary:responseObject error:nil];
        succeedBlock(JsonModelX);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}
    
- (void)makeData4:(QuestReviewsBlock)succeedBlock error:(EorrorBlock)errorBlock andid:(NSString *)idString {
    NSString* urlString = [NSString stringWithFormat:@"https://news-at.zhihu.com/api/4/news/%@/short-comments", idString];
  
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //ReviewsModel* JsonModelX = [[ReviewsModel alloc] initWithDictionary:responseObject error:nil];
        ReviewsModel* JsonModelX = [[ReviewsModel alloc] initWithDictionary:responseObject error:nil];
        succeedBlock(JsonModelX);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}
    
- (void)makeData5:(QuestLongReviewsBlock)succeedBlock error:(EorrorBlock)errorBlock andid:(NSString *)idString {
    NSString* urlString = [NSString stringWithFormat:@"https://news-at.zhihu.com/api/4/news/%@/long-comments", idString];

    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LongReviewsModel* JsonModelX = [[LongReviewsModel alloc] initWithDictionary:responseObject error:nil];
        succeedBlock(JsonModelX);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
}
   
@end

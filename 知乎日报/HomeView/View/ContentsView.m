//
//  ContentsView.m
//  知乎日报
//
//  Created by 付闯 on 2023/10/15.
//

#import "ContentsView.h"
#import "TopStoriesContentsViewController.h"
#import "contentsTableViewCell.h"
#import<SDWebImage/UIImageView+WebCache.h>
#import "Manager.h"
#define widt [UIScreen mainScreen].bounds.size.width
#define heigh [UIScreen mainScreen].bounds.size.height
int flage = 0;
@implementation ContentsView
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    self.homeTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, widt, heigh) style:UITableViewStyleGrouped];
    
    self.homeTableView.delegate = self;
    self.homeTableView.dataSource = self;
    self.homeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.homeTableView.showsVerticalScrollIndicator = NO;
    self.homeTableView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.homeTableView];
    
    [self.homeTableView registerClass:[contentsTableViewCell class] forCellReuseIdentifier:@"111"];
    [self.homeTableView registerClass:[contentsTableViewCell class] forCellReuseIdentifier:@"222"];
    [self.homeTableView registerClass:[contentsTableViewCell class] forCellReuseIdentifier:@"333"];
    
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
    self.activityIndicator.frame = CGRectMake(0.4 * widt, 0.9 * heigh, 100, 100);
    self.activityIndicator.color = [UIColor blueColor];
    self.activityIndicator.backgroundColor = [UIColor clearColor];
    self.activityIndicator.hidesWhenStopped = YES;
    [self addSubview:self.activityIndicator];
    
    self.dictinaryArray = [NSMutableArray array];
    self.urlArray = [NSMutableArray array];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(firstRecevid:) name:@"fistSender" object:nil];
    
    return self;
    
   
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   
    return self.dictinaryArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 6;
    } else {
        return 5;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        return widt;
    }
    
    return 120;
}
- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section != 0) {
        UILabel* dateLale = [[UILabel alloc] init];
        self.model = self.dictinaryArray[section];
        NSString* dateString = self.model.date;
        NSString* monthString = [dateString substringWithRange:NSMakeRange(4, 2)];
        NSString* dayString = [dateString substringWithRange:NSMakeRange(6, 2)];
        dateLale.text = [NSString stringWithFormat:@"     %@月%@日  ",monthString, dayString];
        dateLale.font = [UIFont systemFontOfSize:15];
        dateLale.frame = CGRectMake(100, 5, 100, 15);
        dateLale.textColor = [UIColor grayColor];
        dateLale.backgroundColor = [UIColor whiteColor];
        return dateLale;
    }
    return nil;
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    } else {
        return 40;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        contentsTableViewCell* cell = [self.homeTableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
        if (self.dictinaryArray.count == 0) {
            return cell;
        }
        
        self.imageScrollView = [[UIScrollView alloc] init];
        self.imageScrollView.frame = CGRectMake(0, 0, widt, widt);
        //[self.imageScrollView setShowsVerticalScrollIndicator:NO];
        self.imageScrollView.showsVerticalScrollIndicator = NO;
        self.imageScrollView.pagingEnabled = YES;
        self.imageScrollView.scrollEnabled = YES;
        self.imageScrollView.contentSize = CGSizeMake(widt * 7, widt);
        self.imageScrollView.contentOffset = CGPointMake(widt, 0);
        self.imageScrollView.delegate = self;
        
        self.imageScrollView.userInteractionEnabled = NO;
        [cell.contentView addGestureRecognizer:self.imageScrollView.panGestureRecognizer];
        
        self.mytimer = [[NSTimer alloc] init];
        self.mytimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timer) userInfo:nil repeats:YES];
        
        for (int i = 0; i <= 6; i++) {
            UILabel* titlelLabel = [[UILabel alloc] init];
            titlelLabel.frame = CGRectMake(30, widt - 110 , widt - 60, 60);
            titlelLabel.textColor = [UIColor whiteColor];
            titlelLabel.font = [UIFont systemFontOfSize:25];
            titlelLabel.textAlignment = NSTextAlignmentLeft;
            titlelLabel.numberOfLines = 0;
            
            UILabel* authorlabel = [[UILabel alloc] init];
            authorlabel.frame = CGRectMake(30, widt - 40, 100, 15);
            authorlabel.textColor = [UIColor systemGray6Color];
            authorlabel.font = [UIFont systemFontOfSize:15];
            
            UIImageView* topImage  = [[UIImageView alloc] init];
            NSString* imageString  = [NSString string];
            self.model = self.dictinaryArray[0];
            if (i == 0) {
                imageString = [self.model.top_stories[4] valueForKey:@"image"];
                titlelLabel.text = [self.model.top_stories[4] valueForKey:@"title"];
                authorlabel.text = [self.model.top_stories[4] valueForKey:@"hint"];
            } else if (i == 6) {
                imageString = [self.model.top_stories[0] valueForKey:@"image"];
                titlelLabel.text = [self.model.top_stories[0] valueForKey:@"title"];
                authorlabel.text = [self.model.top_stories[0] valueForKey:@"hint"];
            } else {
                imageString = [self.model.top_stories[i - 1] valueForKey:@"image"];
                titlelLabel.text = [self.model.top_stories[i - 1] valueForKey:@"title"];
                authorlabel.text = [self.model.top_stories[i - 1] valueForKey:@"hint"];
                
            }
            NSURL* url = [NSURL URLWithString:imageString];
            [topImage sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"default"]];
            [topImage addSubview:titlelLabel];
            [topImage addSubview:authorlabel];
            topImage.frame = CGRectMake(widt * i, 0, widt, widt);
            [self.imageScrollView addSubview:topImage];
            [cell addSubview:self.imageScrollView];
        }
        return cell;
    } else if (indexPath.section == 0 && indexPath.row != 0) {
        
        self.model = self.dictinaryArray[0];
        contentsTableViewCell* cell = [self.homeTableView dequeueReusableCellWithIdentifier:@"222" forIndexPath:indexPath];
        cell.storiesTitleLabel.text = [self.model.stories[indexPath.row - 1] valueForKey:@"title"];
        cell.storiesAuthorLabel.text = [self.model.stories[indexPath.row - 1] valueForKey:@"hint"];
        NSString* stoiesImage  = [self.model.stories[indexPath.row - 1] valueForKey:@"images"][0];
        [cell.striosImage sd_setImageWithURL:[NSURL URLWithString:stoiesImage] placeholderImage:[UIImage imageNamed:@"defalut"]];
        return cell;
    }else {
        contentsTableViewCell* cell = [self.homeTableView dequeueReusableCellWithIdentifier:@"333" forIndexPath:indexPath];
        self.model = self.dictinaryArray[indexPath.section];
        cell.storiesTitleLabel.text = [self.model.stories[indexPath.row] valueForKey:@"title"];
        cell.storiesAuthorLabel.text = [self.model.stories[indexPath.row] valueForKey:@"hint"];
        NSString* stoiesImage  = [self.model.stories[indexPath.row] valueForKey:@"images"][0];
        [cell.striosImage sd_setImageWithURL:[NSURL URLWithString:stoiesImage] placeholderImage:[UIImage imageNamed:@"defalut"]];
        return cell;
    }
}
- (void)timer {
    int num = self.imageScrollView.contentOffset.x / widt;
    [self.imageScrollView setContentOffset:CGPointMake(widt * (num + 1), 0) animated:YES];
    if (num == 6) {
        self.imageScrollView.contentOffset = CGPointMake(widt, 0);
    }
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    [self.mytimer invalidate];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    self.mytimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timer) userInfo:nil repeats:YES];
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (self.imageScrollView.contentOffset.x == widt * 6) {
        self.imageScrollView.contentOffset = CGPointMake(widt, 0);
    }
    if (self.imageScrollView.contentOffset.x == widt * 0) {
        self.imageScrollView.contentOffset = CGPointMake(widt * 5, 0);
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.section == 0 && indexPath.row == 0) {
        self.urlArray = [NSMutableArray array];
        self.idArray = [NSMutableArray array];
        for (int i = 0; i < 5; i++)  {
            self.model = self.dictinaryArray[0];
            [self.urlArray addObject:[self.model.top_stories[i]  valueForKey:@"url"]];
            [self.idArray addObject:[self.model.top_stories[i] valueForKey:@"id"]];
        }
        [self.topstoriesDictionaryArray addObject:self.dictinaryArray[0]];
        
        self.num1 = [NSNumber numberWithInt:self.imageScrollView.contentOffset.x / widt - 1];//self.imageScrollView.contentOffset.x / widt;
        if (self.num1 == [NSNumber numberWithInt:5]) {
            self.num1 = [NSNumber numberWithInt:0];
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:@"TopStoryurlSender" object:nil userInfo:nil];
    } else {
        self.urlArray = [NSMutableArray array];
        self.idArray  = [NSMutableArray array];
        
        for(int i = 0; i < self.dictinaryArray.count; i++) {
            self.model = self.dictinaryArray[i];
            for (int i = 0; i < 5; i++) {
                [self.urlArray addObject:[self.model.stories[i] valueForKey:@"url"]];
                [self.idArray addObject:[self.model.stories[i] valueForKey:@"id"]];
            }
        }
        self.num2 = [[NSNumber alloc] init];
        if (indexPath.section == 0) {
            self.num2 = [NSNumber numberWithInt:(int)indexPath.row  - 1];
        } else {
             self.num2 = [NSNumber numberWithInt:(int)(indexPath.row + indexPath.section * 5)];
        }
        self.model = [self.dictinaryArray lastObject];
        self.lastDate = [self.model valueForKey:@"date"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"StoryurlSender" object:nil userInfo:nil];
    }
}
- (void)firstRecevid:(NSNotification*)sender {
    [self.dictinaryArray addObject:sender.userInfo[@"storyModel"]];
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSLog(@"21824");
    if (self.homeTableView.contentOffset.y + heigh > self.homeTableView.contentSize.height) {
        NSLog(@"19801274");
        [self.activityIndicator startAnimating];
         self.model1 = [self.dictinaryArray lastObject];
         NSString* date = self.model1.date;
         
         NSDictionary* dictionary = [NSDictionary dictionaryWithObject:date forKey:@"date"];
         [[NSNotificationCenter defaultCenter] postNotificationName:@"dateSender" object:nil userInfo:dictionary];
         [[Manager shareManager] makeData2:^(ContentsModel * _Nonnull ViewModel1) {
         [self.dictinaryArray addObject:ViewModel1];
         [self.homeTableView reloadData];
         [self.activityIndicator stopAnimating];
         } error:^(NSError * _Nonnull error) {
         NSLog(@"请求失败");
         } andLastDate:date];
        
        /*[self.activityIndicator startAnimating];
        self.model1 = [self.dictinaryArray lastObject];
        self.date  = self.model1.date;
        
        dispatch_group_t group = dispatch_group_create();
        
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        
        dispatch_group_enter(group);
        
        
        dispatch_group_async(group, queue, ^{
            [[Manager shareManager] makeData2:^(ContentsModel * _Nonnull ViewModel1) {
                self.date = ViewModel1.date;
                    [self.dictinaryArray addObject:ViewModel1];
                NSLog(@"1");
                    dispatch_group_leave(group);
                } error:^(NSError * _Nonnull error) {
                    dispatch_group_leave(group);
                    NSLog(@"请求失败");
                } andLastDate:self.date];
        });
                        
        //dispatch_group_wait(group, DISPATCH_TIME_FOREVER);// 1执行完 下面才会执行
        
        self.model1 = [self.dictinaryArray lastObject];
        NSLog(@"%@", self.model1);
        self.date  = self.model1.date;
        NSLog(@"%@", self.date);
        dispatch_group_enter(group);
        //dispatch_group_wait(group, DISPATCH_TIME_FOREVER);// 1执行完 下面才会执行
        
        
        dispatch_group_async(group, queue, ^{
            [[Manager shareManager] makeData2:^(ContentsModel * _Nonnull ViewModel1) {
                self.date = ViewModel1.date;
                    [self.dictinaryArray addObject:ViewModel1];
                NSLog(@"2");
                    dispatch_group_leave(group);
                } error:^(NSError * _Nonnull error) {
                    dispatch_group_leave(group);
                    NSLog(@"请求失败");
                } andLastDate:self.date];
        });
       
        //dispatch_group_wait(group, DISPATCH_TIME_FOREVER);// 1执行完 下面才会执行
        
        self.model1 = [self.dictinaryArray lastObject];
        NSLog(@"%@", self.model1);
        //self.date  = self.model1.date;
        NSLog(@"%@", self.date);
        dispatch_group_enter(group);
        //dispatch_group_wait(group, DISPATCH_TIME_FOREVER);// 1执行完 下面才会执行
        
        dispatch_group_async(group, queue, ^{
            [[Manager shareManager] makeData2:^(ContentsModel * _Nonnull ViewModel1) {
                NSLog(@"3");
                self.date = ViewModel1.date;
                    [self.dictinaryArray addObject:ViewModel1];
                    dispatch_group_leave(group);
                } error:^(NSError * _Nonnull error) {
                    dispatch_group_leave(group);
                    NSLog(@"请求失败");
                } andLastDate:self.date];
        });
        
        dispatch_group_notify(group, queue, ^{
            NSLog(@"三次网络请求完成");
            [self.homeTableView reloadData];
            [self.activityIndicator stopAnimating];
        });*/
        
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

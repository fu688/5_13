//
//  ReviewsView.m
//  知乎日报
//
//  Created by 付闯 on 2023/10/29.
//

#import "ReviewsView.h"
#import "Masonry.h"
#import "ReviewViewCell.h"
#import<SDWebImage/UIImageView+WebCache.h>
#define widt [UIScreen mainScreen].bounds.size.width
#define heigh [UIScreen mainScreen].bounds.size.height
@implementation ReviewsView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
   
    
    self.topView = [[UIView alloc] init];
    self.topView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(0);
        make.top.equalTo(self).offset(0);
        make.width.offset(widt);
        make.height.offset(100);
    }];

    self.returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.returnButton setImage:[UIImage imageNamed:@"fanhui1-copy"] forState:UIControlStateNormal];
    [self.topView addSubview:self.returnButton];
    [self.returnButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.topView).offset(10);
        make.top.equalTo(self.topView).offset(50);
        make.width.offset(30);
        make.height.offset(30);
    }];
    

    self.titlelabel = [[UILabel alloc] init];
    self.titlelabel.font = [UIFont systemFontOfSize:20];
    self.titlelabel.textColor = [UIColor blackColor];
    [self.topView addSubview:self.titlelabel];
    [self.titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.topView).offset(widt / 2 - 50);
        make.top.equalTo(self.topView).offset(60);
        make.width.offset(100);
        make.height.offset(20);
    }];

    
    self.reviewsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, widt, heigh)];
    self.reviewsTableView.delegate = self;
    self.reviewsTableView.dataSource = self;
    self.reviewsTableView.estimatedRowHeight = 100;
    self.reviewsTableView.rowHeight = UITableViewAutomaticDimension;
    [self addSubview:self.reviewsTableView];
    [self.reviewsTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(0);
        make.top.equalTo(self).offset(100);
        make.width.offset(widt);
        make.height.offset(heigh - 100);
    }];    
    
    [self.reviewsTableView registerClass:[ReviewViewCell class] forCellReuseIdentifier:@"111"];
    [self.reviewsTableView registerClass:[ReviewViewCell class] forCellReuseIdentifier:@"222"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(commentsRecevid:) name:@"commentsSender" object:nil];
    
    
    self.k = 0;
    return self;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.LongReviewsModel.comments.count == 0 && self.shortReviewsModel.comments.count == 0) {
        return 0;
    }
    if (self.LongReviewsModel.comments.count == 0) {
        return 1;
    } else {
        return 2;
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section  {
    if (self.LongReviewsModel.comments.count != 0) {
        if (section == 0) {
            return [self.LongReviewsModel.comments count];
        }else {
            return [self.shortReviewsModel.comments count];
        }
       
    } else  {
        return [self.shortReviewsModel.comments count];
    }
 
}
- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.LongReviewsModel.comments.count != 0) {
        if (indexPath.section == 0) {
            
            if ([self.LongReviewsModel.comments[indexPath.row] valueForKey:@"reply_to"]) {
                ReviewViewCell* cell = [self.reviewsTableView dequeueReusableCellWithIdentifier:@"222" forIndexPath:indexPath];
                
                NSURL* url = [NSURL URLWithString:[self.LongReviewsModel.comments[indexPath.row] valueForKey:@"avatar"]];
                [cell.userIcon sd_setImageWithURL:url];
                
                cell.userName.text = [self.LongReviewsModel.comments[indexPath.row] valueForKey:@"author"];
                
                cell.userComment.text = [self.LongReviewsModel.comments[indexPath.row] valueForKey:@"content"];
                
                cell.replyComment.text = [NSString stringWithFormat:@"//%@:  %@",[[self.LongReviewsModel.comments[indexPath.row] valueForKey:@"reply_to"] valueForKey:@"author"], [[self.LongReviewsModel.comments[indexPath.row] valueForKey:@"reply_to"] valueForKey:@"content"]];
                
                cell.changeButton.titleLabel.textColor = [UIColor grayColor];
                cell.changeButton.tag = indexPath.row + 10000;
                [cell.changeButton addTarget:self action:@selector(pressChangeButton:) forControlEvents:UIControlEventTouchUpInside];
                
                double timeValue = [[self.LongReviewsModel.comments[indexPath.row] valueForKey:@"time"] doubleValue];
                NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeValue];
                    
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                [formatter setDateStyle:NSDateFormatterMediumStyle];
                [formatter setTimeStyle:NSDateFormatterShortStyle];
                [formatter setDateFormat:@"MM-dd HH:mm"];
                    
                cell.time.text = [formatter stringFromDate:date];
                
                [cell.likeButton setImage:[UIImage imageNamed:@"good"] forState:UIControlStateNormal];
                
                cell.commentButton.image = [UIImage imageNamed:@"pinglun1"];
                
                cell.likeNumber.text = [self.LongReviewsModel.comments[indexPath.row] valueForKey:@"likes"];
                
                if ([self.longSelectedArray[indexPath.row] isEqualToString:@"1"]) {
                    cell.changeButton.hidden = YES;
                    cell.replyComment.numberOfLines = 0;
                }
                if ([self.longSelectedArray[indexPath.row] isEqualToString:@"2"]) {
                    cell.changeButton.hidden = NO;
                    [cell.changeButton setTitle:@".  展开全文" forState:UIControlStateNormal];
                    cell.replyComment.numberOfLines  = 2;
                }
                if ([self.longSelectedArray[indexPath.row] isEqualToString:@"3"]) {
                    cell.changeButton.hidden = NO;
                    [cell.changeButton setTitle:@".  收起" forState:UIControlStateNormal];
                    cell.replyComment.numberOfLines  = 0;
                }
                
                return cell;
                
            }else {
                ReviewViewCell* cell = [self.reviewsTableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
                NSURL* url = [NSURL URLWithString:[self.LongReviewsModel.comments[indexPath.row] valueForKey:@"avatar"]];
                [cell.userIcon sd_setImageWithURL:url];
                
                cell.userName.text = [self.LongReviewsModel.comments[indexPath.row] valueForKey:@"author"];
                
                cell.userComment.text = [self.LongReviewsModel.comments[indexPath.row] valueForKey:@"content"];
                
                double timeValue = [[self.LongReviewsModel.comments[indexPath.row] valueForKey:@"time"] doubleValue];
                NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeValue];
                    
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                [formatter setDateStyle:NSDateFormatterMediumStyle];
                [formatter setTimeStyle:NSDateFormatterShortStyle];
                [formatter setDateFormat:@"MM-dd HH:mm"];
                    
                cell.time.text = [formatter stringFromDate:date];
                
                [cell.likeButton setImage:[UIImage imageNamed:@"good"] forState:UIControlStateNormal];
                
                cell.commentButton.image = [UIImage imageNamed:@"pinglun1"];
                
                cell.likeNumber.text = [self.LongReviewsModel.comments[indexPath.row] valueForKey:@"likes"];
                return cell;
                
            }
            
            
            
        } else {
            if ([self.shortReviewsModel.comments[indexPath.row] valueForKey:@"reply_to"]) {
                ReviewViewCell* cell = [self.reviewsTableView dequeueReusableCellWithIdentifier:@"222" forIndexPath:indexPath];
                
                NSURL* url = [NSURL URLWithString:[self.shortReviewsModel.comments[indexPath.row] valueForKey:@"avatar"]];
                [cell.userIcon sd_setImageWithURL:url];
                
                cell.userName.text = [self.shortReviewsModel.comments[indexPath.row] valueForKey:@"author"];
                
                cell.userComment.text = [self.shortReviewsModel.comments[indexPath.row] valueForKey:@"content"];
                
                cell.replyComment.text = [NSString stringWithFormat:@"//%@:  %@",[[self.shortReviewsModel.comments[indexPath.row] valueForKey:@"reply_to"] valueForKey:@"author"], [[self.shortReviewsModel.comments[indexPath.row] valueForKey:@"reply_to"] valueForKey:@"content"]];
                
                cell.changeButton.titleLabel.textColor = [UIColor grayColor];
                cell.changeButton.tag = indexPath.row;
                [cell.changeButton addTarget:self action:@selector(pressChangeButton:) forControlEvents:UIControlEventTouchUpInside];
                
                double timeValue = [[self.shortReviewsModel.comments[indexPath.row] valueForKey:@"time"] doubleValue];
                NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeValue];
                
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                [formatter setDateStyle:NSDateFormatterMediumStyle];
                [formatter setTimeStyle:NSDateFormatterShortStyle];
                [formatter setDateFormat:@"MM-dd HH:mm"];
                
                cell.time.text = [formatter stringFromDate:date];
                
                [cell.likeButton setImage:[UIImage imageNamed:@"good"] forState:UIControlStateNormal];
                
                cell.commentButton.image = [UIImage imageNamed:@"pinglun1"];
                //cell.time.text = [self.shortReviewsModel.comments[indexPath.row] valueForKey:@"time"];
                
                cell.likeNumber.text = [self.shortReviewsModel.comments[indexPath.row] valueForKey:@"likes"];
                
                
                if ([self.selectedArray[indexPath.row] isEqualToString:@"1"]) {
                    cell.changeButton.hidden = YES;
                    cell.replyComment.numberOfLines = 0;
                }
                if ([self.selectedArray[indexPath.row] isEqualToString:@"2"]) {
                    cell.changeButton.hidden = NO;
                    [cell.changeButton setTitle:@".  展开全文" forState:UIControlStateNormal];
                    cell.replyComment.numberOfLines  = 2;
                }
                if ([self.selectedArray[indexPath.row] isEqualToString:@"3"]) {
                    cell.changeButton.hidden = NO;
                    [cell.changeButton setTitle:@".  收起" forState:UIControlStateNormal];
                    cell.replyComment.numberOfLines  = 0;
                }
                return cell;
                
            }else {
                
                ReviewViewCell* cell = [self.reviewsTableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
                NSURL* url = [NSURL URLWithString:[self.shortReviewsModel.comments[indexPath.row] valueForKey:@"avatar"]];
                [cell.userIcon sd_setImageWithURL:url];
                
                cell.userName.text = [self.shortReviewsModel.comments[indexPath.row] valueForKey:@"author"];
                
                cell.userComment.text = [self.shortReviewsModel.comments[indexPath.row] valueForKey:@"content"];
                
                double timeValue = [[self.shortReviewsModel.comments[indexPath.row] valueForKey:@"time"] doubleValue];
                NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeValue];
                
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                [formatter setDateStyle:NSDateFormatterMediumStyle];
                [formatter setTimeStyle:NSDateFormatterShortStyle];
                [formatter setDateFormat:@"MM-dd HH:mm"];
                
                cell.time.text = [formatter stringFromDate:date];
                
                [cell.likeButton setImage:[UIImage imageNamed:@"good"] forState:UIControlStateNormal];
                
                cell.commentButton.image = [UIImage imageNamed:@"pinglun1"];
                
                cell.likeNumber.text = [self.shortReviewsModel.comments[indexPath.row] valueForKey:@"likes"];
                return cell;
            }
        }
    } else {
        if ([self.shortReviewsModel.comments[indexPath.row] valueForKey:@"reply_to"]) {
            ReviewViewCell* cell = [self.reviewsTableView dequeueReusableCellWithIdentifier:@"222" forIndexPath:indexPath];
            
            NSURL* url = [NSURL URLWithString:[self.shortReviewsModel.comments[indexPath.row] valueForKey:@"avatar"]];
            [cell.userIcon sd_setImageWithURL:url];
            
            cell.userName.text = [self.shortReviewsModel.comments[indexPath.row] valueForKey:@"author"];
            
            cell.userComment.text = [self.shortReviewsModel.comments[indexPath.row] valueForKey:@"content"];
            
            cell.replyComment.text = [NSString stringWithFormat:@"//%@:  %@",[[self.shortReviewsModel.comments[indexPath.row] valueForKey:@"reply_to"] valueForKey:@"author"] , [[self.shortReviewsModel.comments[indexPath.row] valueForKey:@"reply_to"] valueForKey:@"content"]];
            
        
            cell.changeButton.titleLabel.textColor = [UIColor grayColor];
            cell.changeButton.tag  = indexPath.row;
            [cell.changeButton addTarget:self action:@selector(pressChangeButton:) forControlEvents:UIControlEventTouchUpInside];
            
            double timeValue = [[self.shortReviewsModel.comments[indexPath.row] valueForKey:@"time"] doubleValue];
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeValue];
            
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateStyle:NSDateFormatterMediumStyle];
            [formatter setTimeStyle:NSDateFormatterShortStyle];
            [formatter setDateFormat:@"MM-dd HH:mm"];
            
            cell.time.text = [formatter stringFromDate:date];
            
            [cell.likeButton setImage:[UIImage imageNamed:@"good"] forState:UIControlStateNormal];
            
            cell.commentButton.image = [UIImage imageNamed:@"pinglun1"];
            
            cell.likeNumber.text = [self.shortReviewsModel.comments[indexPath.row] valueForKey:@"likes"];
            
            
            if ([self.selectedArray[indexPath.row] isEqualToString:@"1"]) {
                cell.changeButton.hidden = YES;
                cell.replyComment.numberOfLines = 0;
            }
            if ([self.selectedArray[indexPath.row] isEqualToString:@"2"]) {
                cell.changeButton.hidden = NO;
                [cell.changeButton setTitle:@".  展开全文" forState:UIControlStateNormal];
                cell.replyComment.numberOfLines  = 2;
            }
            if ([self.selectedArray[indexPath.row] isEqualToString:@"3"]) {
                cell.changeButton.hidden = NO;
                [cell.changeButton setTitle:@".  收起" forState:UIControlStateNormal];
                cell.replyComment.numberOfLines  = 0;
            }
            return cell;
            
        }else {
            
            ReviewViewCell* cell = [self.reviewsTableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
            NSURL* url = [NSURL URLWithString:[self.shortReviewsModel.comments[indexPath.row] valueForKey:@"avatar"]];
            [cell.userIcon sd_setImageWithURL:url];
            
            cell.userName.text = [self.shortReviewsModel.comments[indexPath.row] valueForKey:@"author"];
            
            cell.userComment.text = [self.shortReviewsModel.comments[indexPath.row] valueForKey:@"content"];
            
            double timeValue = [[self.shortReviewsModel.comments[indexPath.row] valueForKey:@"time"] doubleValue];
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeValue];
            
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateStyle:NSDateFormatterMediumStyle];
            [formatter setTimeStyle:NSDateFormatterShortStyle];
            [formatter setDateFormat:@"MM-dd HH:mm"];
            
            cell.time.text = [formatter stringFromDate:date];
            
            [cell.likeButton setImage:[UIImage imageNamed:@"good"] forState:UIControlStateNormal];
            
            cell.commentButton.image = [UIImage imageNamed:@"pinglun1"];
            
            cell.likeNumber.text = [self.shortReviewsModel.comments[indexPath.row] valueForKey:@"likes"];
            return cell;
        }
    }
}
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    UITableViewHeaderFooterView* header  = (UITableViewHeaderFooterView*)view;
    header.contentView.backgroundColor = [UIColor clearColor];
    header.textLabel.font = [UIFont systemFontOfSize:20];
    header.textLabel.textColor = [UIColor blackColor];
    if (self.LongReviewsModel.comments.count != 0) {
        if (section == 0) {
            NSString* str  = [NSString stringWithFormat:@"%lu条长评",[self.LongReviewsModel.comments count]];
            header.textLabel.text = str;
        }
        if (section == 1) {
            NSString* str  = [NSString stringWithFormat:@"%lu条短评",[self.shortReviewsModel.comments count]];
            header.textLabel.text = str;
        }
    } else {
        NSString* str  = [NSString stringWithFormat:@"%lu条短评",[self.shortReviewsModel.comments count]];
        header.textLabel.text = str;
    }
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"111";
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 20;
}

- (void)commentsRecevid:(NSNotification*)sender {
    self.titlelabel.text = [NSString stringWithFormat:@"%lu条评论",self.shortReviewsModel.comments.count + self.LongReviewsModel.comments.count];
    
    self.selectedArray = [NSMutableArray array];
    self.longSelectedArray = [NSMutableArray array];
    
    for (int i = 0; i < self.shortReviewsModel.comments.count; i++) {
        [self.selectedArray addObject:@"0"];
    }
    for (int i = 0; i < self.shortReviewsModel.comments.count; i++) {
        if ([self.shortReviewsModel.comments[i] valueForKey:@"reply_to"]) {
            NSString* shortstr = [NSString stringWithFormat:@"//%@:  %@",[[self.shortReviewsModel.comments[i] valueForKey:@"reply_to"] valueForKey:@"author"] , [[self.shortReviewsModel.comments[i] valueForKey:@"reply_to"] valueForKey:@"content"]];
            UILabel* shortLabel = [[UILabel alloc] init];
            shortLabel.font = [UIFont systemFontOfSize:15];
            NSInteger count = [self textHeightFromTextString:shortstr width:widt - 90 fontSize:15].height / shortLabel.font.lineHeight;
            if (count <= 2) {
                [self.selectedArray replaceObjectAtIndex:i withObject:@"1"];
            } else {
                [self.selectedArray replaceObjectAtIndex:i withObject:@"2"];
            }
        }
    }
    
    for (int i = 0; i < self.LongReviewsModel.comments.count; i++) {
        [self.longSelectedArray addObject:@"0"];
    }
    for (int i = 0; i < self.LongReviewsModel.comments.count; i++) {
        if ([self.LongReviewsModel.comments[i] valueForKey:@"reply_to"]) {
            NSString* longstr = [NSString stringWithFormat:@"//%@:  %@",[[self.LongReviewsModel.comments[i] valueForKey:@"reply_to"] valueForKey:@"author"] , [[self.LongReviewsModel.comments[i] valueForKey:@"reply_to"] valueForKey:@"content"]];
            UILabel* longLabel = [[UILabel alloc] init];
            longLabel.font = [UIFont systemFontOfSize:15];
            NSInteger count = [self textHeightFromTextString:longstr width:widt - 90 fontSize:15].height / longLabel.font.lineHeight;
            if (count <= 2) {
                [self.longSelectedArray replaceObjectAtIndex:i withObject:@"1"];
            } else {
                [self.longSelectedArray replaceObjectAtIndex:i withObject:@"2"];
            }
        }
    }
    
    //NSLog(@"%@", self.longSelectedArray);
    //NSLog(@"%@", self.selectedArray);
    
}
-(CGSize)textHeightFromTextString:(NSString *)text width:(CGFloat)textWidth fontSize:(CGFloat)size{
    // 计算 label 需要的宽度和高度
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:size]};
    CGRect rect = [text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    
     CGSize size1 = [text sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:size]}];
    
    return CGSizeMake(size1.width, rect.size.height);
}
- (void)pressChangeButton:(UIButton*) btn {
    if (btn.tag > 10000) {
        if ([self.longSelectedArray[btn.tag - 10000] isEqualToString:@"2"]) {
            [self.longSelectedArray replaceObjectAtIndex:(int)btn.tag withObject:@"3"];
        } else {
            [self.longSelectedArray replaceObjectAtIndex:(int)btn.tag withObject:@"2"];
        }
    } else {
        if ([self.selectedArray[btn.tag] isEqualToString:@"2"]) {
            [self.selectedArray replaceObjectAtIndex:(int)btn.tag withObject:@"3"];
            self.selectedArray[btn.tag] = @"3";
        } else {
            [self.selectedArray replaceObjectAtIndex:(int)btn.tag withObject:@"2"];
        }
    }
    //NSLog(@"%@", self.longSelectedArray);
    //NSLog(@"%@", self.selectedArray);
    [self.reviewsTableView reloadData];
    
}
/*
 // Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

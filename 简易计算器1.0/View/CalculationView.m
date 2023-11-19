//
//  CalculationView.m
//  简易计算器1.0
//
//  Created by 付闯 on 2023/9/27.
//

#import "CalculationView.h"
#import "Masonry.h"
#define widt [UIScreen mainScreen].bounds.size.width
#define heigh [UIScreen mainScreen].bounds.size.height
@implementation CalculationView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.backgroundColor = [UIColor blackColor];
    
    /*self.button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button1 setTitle:@"1111" forState:UIControlStateNormal];
    [self addSubview:self.button1];
    [self.button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(50);
        make.left.equalTo(self).offset(0);
        make.width.offset(widt);
        make.height.offset(50);
    }];*/
    self.buttonDelete = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonLeft = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonRigth = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonDivide = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonSeven = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonEigtht = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonNine = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonMutiply = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonFour = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonFive = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonSix = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonSubtract = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonOne = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonThree = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonAdd = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonZero = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonPoint = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonEqual = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    self.showLael = [[UILabel alloc] init];
    self.showLael.textColor = [UIColor whiteColor];
    self.showLael.font = [UIFont systemFontOfSize:60];
    self.showLael.textAlignment = NSTextAlignmentRight;
    self.showLael.numberOfLines = 0;
    //self.showLael.text = @"1111";
    [self addSubview:self.showLael];
    [self.showLael mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(100);
        make.left.equalTo(self).offset(0);
        make.width.offset(widt);
        make.height.offset(300);
    }];
    
    self.showErrorLabel = [[UILabel alloc] init];
    self.showErrorLabel.textColor = [UIColor whiteColor];
    self.showErrorLabel.font = [UIFont systemFontOfSize:60];
    self.showErrorLabel.textAlignment = NSTextAlignmentRight;
    self.showErrorLabel.numberOfLines = 0;
    //self.showLael.text = @"1111";
    [self addSubview:self.showErrorLabel];
    [self.showErrorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(160);
        make.left.equalTo(self).offset(0);
        make.width.offset(widt);
        make.height.offset(300);
    }];
    
    //self.showString = [[NSMutableString alloc] init];
    
    self.buttonarray = [NSArray arrayWithObjects:self.buttonDelete, self.buttonLeft, self.buttonRigth, self.buttonDivide, self.buttonSeven, self.buttonEigtht, self.buttonNine, self.buttonMutiply,self.buttonFour,self.buttonFive,self.buttonSix, self.buttonSubtract, self.buttonOne,self.buttonTwo, self.buttonThree, self.buttonAdd, self.buttonZero, self.buttonPoint, self.buttonEqual, nil];
    self.buttonContentArray =  [NSMutableArray arrayWithObjects:@"AC", @"(", @")",@"/", @"7", @"8", @"9", @"*", @"4", @"5", @"6", @"-", @"1", @"2", @"3", @"+", @"0", @".", @"=", nil];
    
    
    int n = 0;
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 4; j++) {
            self.button = [[UIButton alloc] init];
            self.button = [self.buttonarray objectAtIndex:n];
            if (i == 0 && j != 3) {
                self.button.backgroundColor = [UIColor grayColor];
            } else if (j == 3) {
                self.button.backgroundColor = [UIColor orangeColor];
            } else {
                self.button.backgroundColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.6];
            }
            [self.button setTitle:self.buttonContentArray[n] forState:UIControlStateNormal];
            self.button.titleLabel.font = [UIFont systemFontOfSize:38];
            if (i == 0 && j != 3) {
                self.button.tintColor = [UIColor blackColor];
            } else {
                self.button.titleLabel.textColor = [UIColor whiteColor];
            }
            self.button.layer.cornerRadius = 38;
            self.button.tag = 100 + n;
            //[self.button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:self.button];
            
            if (i == 4 && j == 0) {
                [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self).offset(400 + (heigh - 400) / 5 * i);
                    make.left.equalTo(self).offset(10 + widt / 4 * j);
                    make.height.offset(widt / 4 - 20);
                    make.width.offset(widt / 2 - 20);
                }];
                j++;
                //n++;
            } else {
                [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self).offset(400 + (heigh - 400) / 5 * i);
                    make.left.equalTo(self).offset(10 + widt / 4 * j);
                    make.height.offset(widt / 4 - 20);
                    make.width.offset(widt / 4 - 20);
                }];
            }
            n++;
        }
    }
    //self.charArray = [[NSMutableArray alloc] init];
    return self;
}

@end

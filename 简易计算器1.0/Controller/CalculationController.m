//
//  ViewController.m
//  简易计算器1.0
//
//  Created by 付闯 on 2023/9/27.
//

#import "CalculationController.h"

@interface CalculationController ()

@end

@implementation CalculationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.calculationView = [[CalculationView alloc] init];
    self.calculationView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    for (UIButton* button in self.calculationView.buttonarray) {
        [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self.view addSubview:self.calculationView];
    
    self.calculationModel = [[CalculationModel alloc] init];
    [self.calculationModel calculationArrayInit];
}
- (void)pressButton:(UIButton*)btn {
    if (btn.tag == 100) {
        self.calculationModel.showString = [NSMutableString string];
        self.calculationView.showErrorLabel.text = [NSMutableString string];
        self.calculationModel.charArray = [NSMutableArray array];
        //NSLog(@"%@1111", self.calculationModel.charArray);
        self.calculationView.showLael.text = self.calculationModel.showString;
        //NSLog(@"%@", self.showString);
    } else if (btn.tag == 118) {
        NSLog(@"%@", self.calculationModel.charArray);
        //NSLog(@"11111");
        if (![self jugdeError:self.calculationModel.charArray andString:self.calculationModel.showString]) {
            self.calculationView.showErrorLabel.text = @"错误";
            
        } else {
            NSMutableString* string = [[NSMutableString alloc] initWithString:[self calclation:self.calculationModel.charArray]];
            NSInteger length = [string length];
            for (NSInteger i = length - 1; i >= 0; i--) {
                if ([string characterAtIndex:i] == '0') {
                    [string deleteCharactersInRange:NSMakeRange(i, 1)];
                } else if ([string characterAtIndex:i] == '.') {
                    [string deleteCharactersInRange:NSMakeRange(i, 1)];
                    break;
                } else {
                    break;
                }
            }
            
            self.calculationView.showLael.text = string;
            self.calculationModel.showString = [NSMutableString string];
            [self.calculationModel.showString appendString:self.calculationView.showLael.text];
            self.calculationModel.charArray = [NSMutableArray array];
            [self.calculationModel.charArray addObject:self.calculationView.showLael.text];
        }
    } else {
        if (![self judgePut:self.calculationView.buttonContentArray[btn.tag - 100] andcharArray:self.calculationModel.charArray]) {
            [self.calculationModel.showString deleteCharactersInRange:NSMakeRange([self.calculationModel.showString length] - 1, 1)];
            [self.calculationModel.charArray removeLastObject];
        }
        if (![self judgePoint:self.calculationView.buttonContentArray[btn.tag - 100] andcharArray:self.calculationModel.charArray]) {
            //NSLog(@"1op");
            [self.calculationModel.showString appendString:self.calculationView.buttonContentArray[btn.tag - 100]];
            [self.calculationModel.charArray addObject:self.calculationView.buttonContentArray[btn.tag - 100]];
            
        }
        self.calculationView.showLael.text = self.calculationModel.showString;
    }
}
NSInteger judgeChar(NSString *str) {
    if ([str isEqualToString:@"+"] || [str isEqualToString:@"-"] || [str isEqualToString:@"."]) {
        return 1;
    } else if ([str isEqualToString:@"*"] || [str isEqualToString:@"/"]) {
        return 2;
    } else {
        return 0;
    }
}
- (NSInteger)judgePoint:(NSString *)string andcharArray:(NSMutableArray *)charArray {
    NSInteger flage = -1;
    NSInteger length = [charArray count];
    for (NSInteger  i = 0; i < length; i++) {
        if ([charArray[i] isEqualToString:@"."]) {
            flage = i;
        }
    }
    //NSLog(@"%d", flage);
    NSInteger j = 0;
    if (flage != -1 && [string isEqualToString:@"."]) {
        //NSLog(@"001083");
        j = 1;
        for (NSInteger  i = flage + 1; i < length; i++) {
            if (judgeChar(charArray[i])) {
                j = 0;
            }
        }
    }
    //NSLog(@"%lu", j);
    return j;
}
- (NSInteger)jugdeError:(NSMutableArray *)charArray andString:(NSMutableString *)string {
    NSInteger flage = 1;
    NSMutableArray* judgeArray = [[NSMutableArray alloc] init];
    NSInteger judgeTop = -1;
    NSInteger length = [charArray count];
    for (NSInteger i = 0; i < length; i++) {
        if ([charArray[i] isEqualToString:@"("]) {
            [judgeArray addObject:charArray[i]];
            judgeTop++;
        }
        if ([charArray[i] isEqualToString:@")"]) {
            judgeTop--;
            if (judgeTop < -1) {
                flage = 0;
                //NSLog(@"111");
                break;
            }
            [judgeArray removeLastObject];
        }
    }
    if (judgeTop > -1) {
        flage = 0;
    }
    for (NSInteger i = 0; i < length; i++) {
        if (i + 1 != length && [charArray[i] isEqualToString:@"("] && ([charArray[i + 1] isEqualToString:@"+"] || [charArray[i + 1] isEqualToString:@"*"] || [charArray[i + 1] isEqualToString:@"/"] || [charArray[i + 1] isEqualToString:@"."] || [charArray[i + 1] isEqualToString:@")"])) {
            flage = 0;
        }
    }
    for (NSInteger i = 0; i < length; i++) {
        if (i != 0 && [charArray[i] isEqualToString:@")"] && ([charArray[i - 1] isEqualToString:@"+"] || [charArray[i - 1] isEqualToString:@"*"] || [charArray[i - 1] isEqualToString:@"/"] || [charArray[i - 1] isEqualToString:@"."])) {
            flage = 0;
        }
    }
    
    //NSLog(@"%lu11111",[charArray count]);
    if (charArray != nil && [charArray count] != 0 && ![charArray isKindOfClass:[NSNull class]]) {
        //NSLog(@"1111");
        if ([[charArray firstObject] isEqualToString:@"*"] ||[[charArray firstObject] isEqualToString:@"/"] || [[charArray firstObject] isEqualToString:@"."]) {
            flage = 0;
        }
        if ([charArray[0] isEqualToString:@"+"]) {
            [charArray removeObjectAtIndex:0];
            [string deleteCharactersInRange:NSMakeRange(0, 1)];
            
        }
        if ([[charArray lastObject] isEqualToString:@"*"] ||[[charArray lastObject] isEqualToString:@"+"] ||[[charArray lastObject] isEqualToString:@"/"] ||[[charArray lastObject] isEqualToString:@"-"] || [[charArray lastObject] isEqualToString:@"."]) {
            [charArray removeLastObject];
            [string deleteCharactersInRange:NSMakeRange([string length] - 1, 1)];
        }
    }
    return flage;
}



- (NSInteger)judgePut:(NSString *)string andcharArray:(NSMutableArray *)charArray {
    if (charArray != nil &&  judgeChar([charArray lastObject]) && judgeChar(string)) {
        return 0;
    }
    return 1;
}


NSInteger Compare(NSString *str) {
    if ([str isEqualToString:@"("] || [str isEqualToString:@")"]) {
        return 1;
    }else if ([str isEqualToString:@"+"]) {
        return 2;
    } else if ([str isEqualToString:@"*"] || [str isEqualToString:@"/"]) {
        return 3;
    } else {
        return 0;
    }
}
NSString* result(NSString* str, NSString* a, NSString* b) {
    double num1 = [a doubleValue];
    double num2 = [b doubleValue];
    if ([str isEqualToString:@"*"]) {
        return [NSString stringWithFormat:@"%lf", num1 * num2];
    } else if ([str isEqualToString:@"+"]) {
        return [NSString stringWithFormat:@"%lf", num2 + num1];
    } else {
        return [NSString stringWithFormat:@"%lf", num2 / num1];
    }
}
- (NSString*)calclation:(NSMutableArray *)changeArray {
    NSInteger length = [changeArray count];
    //NSLog(@"%lu", length);
    NSMutableArray* behindArray = [[NSMutableArray alloc] init];
    //NSInteger behindTop = -1;
    
    NSMutableArray* symbolArray = [[NSMutableArray alloc] init];
    NSInteger symbolTop = -1;
    
    int count = 0;
    for (int i = 0; i < length + count; i++) {
        if ([changeArray[i] isEqualToString:@"-"] && i != 0 && ![changeArray[i - 1] isEqualToString:@"("]) {
            [changeArray insertObject:@"+" atIndex:i];
            count++;
            i++;
        }
    }
    NSLog(@"%@", changeArray);
    length = [changeArray count];
    NSInteger i = 0;
    while (i < length) {
        NSMutableString* string = [NSMutableString string];
        if (!Compare(changeArray[i])) {
            while (i < length && !Compare(changeArray[i])) {
                [string appendString:changeArray[i]];
                i++;
            }
            [behindArray addObject:string];
            NSLog(@"%@", behindArray);
        } else if ([changeArray[i] isEqualToString:@"("]) {
            [symbolArray addObject:changeArray[i]];
            i++;
            symbolTop++;
            NSLog(@"%@", behindArray);
        } else if ([changeArray[i] isEqualToString:@")"]) {
            while (![symbolArray[symbolTop] isEqualToString:@"("]) {
                [behindArray addObject:symbolArray[symbolTop]];
                symbolTop--;
                [symbolArray removeLastObject];
            }
            [symbolArray removeLastObject];
            symbolTop--;
            i++;
        } else {
            if (symbolTop == -1 || Compare(changeArray[i]) > Compare(symbolArray[symbolTop])) {
                [symbolArray addObject:changeArray[i]];
                NSLog(@"%@",symbolArray);
                symbolTop++;
                i++;
            } else {
                while (symbolTop != -1 && (Compare(changeArray[i]) <= Compare(symbolArray[symbolTop]))) {
                    [behindArray addObject:symbolArray[symbolTop]];
                    [symbolArray removeLastObject];
                    symbolTop--;
                    NSLog(@"%@", behindArray);
                }
                [symbolArray addObject:changeArray[i]];
                NSLog(@"%@", symbolArray);
                //[symbolArray removeLastObject];
                symbolTop++;
                i++;
            }
        }
    }
    while (symbolTop != -1) {
        [behindArray addObject:symbolArray[symbolTop]];
        symbolTop--;
    }
    NSLog(@"%@", behindArray);
    length = [behindArray count];
    
    NSMutableArray* numStack = [[NSMutableArray alloc] init];
    NSInteger numTop = -1;
    i = 0;
    //float value = 0;
    while (i < length) {
        if (!Compare(behindArray[i])) {
            [numStack addObject:behindArray[i]];
            numTop++;
            NSLog(@"%@", numStack);
            i++;
        } else {
            NSString* a = numStack[numTop];
            numTop--;
            [numStack removeLastObject];
            NSString* b = numStack[numTop];
            [numStack removeLastObject];
            [numStack addObject:result(behindArray[i], a, b)];
            NSLog(@"%@", numStack);
            i++;
        }
    }
    if (numTop != -1) {
        //NSLog(@"222");
        return numStack[0];
    } else {
        return @"";
    }
}
@end

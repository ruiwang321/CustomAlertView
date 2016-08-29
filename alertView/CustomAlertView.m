//
//  CustomAlertView.m
//  alertView
//
//  Created by ruiwang on 16/8/25.
//  Copyright © 2016年 ruiwang. All rights reserved.
//

#import "CustomAlertView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define KEY_WINDOW [[UIApplication sharedApplication] keyWindow]

#define BTN_FONT 15
#define MSG_FONT 14
#define TITLE_FONT 18

@interface CustomAlertView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) UIButton *confBtn;
@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, copy) result rrr;

@end

@implementation CustomAlertView

+ (void)customAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle confirmButtonTitle:(NSString *)confirmButtonTitle result:(result)result{
    CustomAlertView *view = [[CustomAlertView alloc] initWithTitle:title message:message cancelButtonTitle:cancelButtonTitle confirmButtonTitle:confirmButtonTitle];
    view.rrr = result;
    [UIView animateWithDuration:0.3 animations:^{
        view.maskView.alpha = 1;
        view.center = CGPointMake(SCREEN_WIDTH/2.0f, SCREEN_HEIGHT/2.0f-50);
    }];
}


- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle confirmButtonTitle:(NSString *)confirmButtonTitle{
    self = [super init];
    if (self) {
        self.maskView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.maskView.backgroundColor = [UIColor colorWithWhite:0.6 alpha:0.4];
        self.maskView.alpha = 0;
        [KEY_WINDOW addSubview:self.maskView];
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = [[UIColor blackColor] CGColor];
        self.layer.borderWidth = 1.0f;
        self.layer.cornerRadius = 5.0f;
        self.frame = CGRectMake(0, 0, 200, 120);
        self.center = CGPointMake(SCREEN_WIDTH/2.0f, -self.frame.size.height/2.0f);
        [self.maskView addSubview:self];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, self.frame.size.width, 20)];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:TITLE_FONT];
        self.titleLabel.text = title;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.titleLabel];
        
        self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleLabel.frame)+5, self.frame.size.width, 40)];
        self.messageLabel.font = [UIFont systemFontOfSize:MSG_FONT];
        self.messageLabel.text = message;
        self.messageLabel.numberOfLines = 2;
        self.messageLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.messageLabel];
        
        self.confBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.frame.size.height-40, self.frame.size.width/2.0f, 40)];
        [self addSubview:self.confBtn];
        [self.confBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.confBtn setTitle:confirmButtonTitle forState:UIControlStateNormal];
        [self.confBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.confBtn.titleLabel.font = [UIFont systemFontOfSize:BTN_FONT];
        self.confBtn.backgroundColor = [UIColor greenColor];
        
        
        self.cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width/2.0f, self.frame.size.height-40, self.frame.size.width/2.0f, 40)];
        [self addSubview:self.cancelBtn];
        [self.cancelBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.cancelBtn setTitle:cancelButtonTitle forState:UIControlStateNormal];
        [self.cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.cancelBtn.titleLabel.font = [UIFont systemFontOfSize:BTN_FONT];
        self.cancelBtn.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)btnClicked:(UIButton *)btn {
    if (self.rrr) {
        if ([btn isEqual:self.confBtn]) {
            self.rrr(YES);
        }else {
            self.rrr(NO);
        }
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        self.center = CGPointMake(SCREEN_WIDTH/2.0f, SCREEN_HEIGHT+self.frame.size.height/2.0f);
        self.maskView.alpha = 0;
    }completion:^(BOOL finished) {

        [self removeFromSuperview];
       
    }];
}

- (void)dealloc {
    [self.maskView removeFromSuperview];
}
@end

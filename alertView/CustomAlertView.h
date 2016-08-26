//
//  CustomAlertView.h
//  alertView
//
//  Created by ruiwang on 16/8/25.
//  Copyright © 2016年 ruiwang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  void(^result)(BOOL isConfirm);
@interface CustomAlertView : UIView

+ (void)customAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle confirmButtonTitle:(NSString *)confirmButtonTitle result:(result)result;

@end

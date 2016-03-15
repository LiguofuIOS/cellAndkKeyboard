//
//  ADo_OptionView.h
//  ADo_OpotionView
//
//  Created by liguofu on 16/3/8.
//  Copyright © 2016年 appcan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADo_OptionViewModel.h"

@interface ADo_OptionView : UITableViewCell

@property (nonatomic, weak) UITextField *detailFiled;
@property (nonatomic, strong) ADo_OptionViewModel *model;
@property (nonatomic, strong) NSIndexPath *cellIndexPath;
- (void)canInpute;
@end

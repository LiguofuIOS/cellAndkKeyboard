//
//  ADo_OptionViewModel.m
//  ADo_OpotionView
//
//  Created by liguofu on 16/3/8.
//  Copyright © 2016年 appcan. All rights reserved.
//

#import "ADo_OptionViewModel.h"

@implementation ADo_OptionViewModel

- (instancetype)initWithIcon:(NSString *)icon summary:(NSString *)summary detail:(NSString *)detail opotionType:(OpotionType)type
{
    self = [super init];
    if (self) {
        self.icon = icon;
        self.summary = summary;
        self.detail = detail;
        self.type = type;
    }
    return self;
}
@end

//
//  ADo_OptionViewModel.h
//  ADo_OpotionView
//
//  Created by liguofu on 16/3/8.
//  Copyright © 2016年 appcan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    OptionType_default,
    OptionType_Input,
    
}OpotionType;

@interface ADo_OptionViewModel : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *detail;

@property (nonatomic, assign)OpotionType type;

@property (nonatomic, copy) void(^action)();

- (instancetype)initWithIcon:(NSString *)icon summary:(NSString *)summary detail:(NSString *)detail opotionType:(OpotionType)type;

@end
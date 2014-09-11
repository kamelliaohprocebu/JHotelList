//
//  Country.m
//  Proto
//
//  Created by 安倍裕貴 on 2014/08/11.
//  Copyright (c) 2014年 Yuki Abe. All rights reserved.
//

#import "Country.h"


@implementation Country

@dynamic name;
@dynamic hotel;
@dynamic area;
@dynamic no;

- (NSComparisonResult) compareNo:(Country*)_country {
    
    NSInteger s = [self.no integerValue];
    NSInteger c = [_country.no integerValue];
    
    NSLog(@"%ld, %ld", (long)s, (long)c);
    
    if (s > c) {
        NSLog(@"%@", @"asc");
        return NSOrderedDescending;
    } else if (s < c) {
        NSLog(@"%@", @"desc");
        return NSOrderedAscending;
    } else {
        return NSOrderedSame;
    }
}


@end


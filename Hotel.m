//
//  Hotel.m
//  Proto
//
//  Created by 安倍裕貴 on 2014/08/11.
//  Copyright (c) 2014年 Yuki Abe. All rights reserved.
//

#import "Hotel.h"
#import "Country.h"


@implementation Hotel

@dynamic detail;
@dynamic name;
@dynamic url;
@dynamic zipcode;
@dynamic country;
@dynamic mail;
@dynamic no;

- (NSComparisonResult) compareNo:(Hotel*)_hotel {
    
    NSInteger s = [self.no integerValue];
    NSInteger c = [_hotel.no integerValue];
    
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

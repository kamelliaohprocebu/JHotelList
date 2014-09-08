//
//  Hotel.h
//  Proto
//
//  Created by 安倍裕貴 on 2014/08/11.
//  Copyright (c) 2014年 Yuki Abe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Country;

@interface Hotel : NSManagedObject

@property (nonatomic, retain) NSString * detail;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSString * zipcode;
@property (nonatomic, retain) NSString * mail;
@property (nonatomic, retain) Country *country;

@end

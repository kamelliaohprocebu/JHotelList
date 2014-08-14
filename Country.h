//
//  Country.h
//  Proto
//
//  Created by 安倍裕貴 on 2014/08/11.
//  Copyright (c) 2014年 Yuki Abe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Country : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *hotel;
@property (nonatomic, retain) NSManagedObject *area;
@end

@interface Country (CoreDataGeneratedAccessors)

- (void)addHotelObject:(NSManagedObject *)value;
- (void)removeHotelObject:(NSManagedObject *)value;
- (void)addHotel:(NSSet *)values;
- (void)removeHotel:(NSSet *)values;

@end

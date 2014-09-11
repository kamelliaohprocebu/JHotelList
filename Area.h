//
//  Area.h
//  Proto
//
//  Created by 安倍裕貴 on 2014/08/11.
//  Copyright (c) 2014年 Yuki Abe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Country;

@interface Area : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *country;
@property (nonatomic, retain) NSNumber *no;
@end

@interface Area (CoreDataGeneratedAccessors)

- (void)addCountryObject:(Country *)value;
- (void)removeCountryObject:(Country *)value;
- (void)addCountry:(NSSet *)values;
- (void)removeCountry:(NSSet *)values;

@end

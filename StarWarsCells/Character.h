//
//  Character.h
//  StarWarsCells
//
//  Created by Allen Spicer on 5/4/16.
//  Copyright © 2016 Allen Spicer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Character : NSObject


@property(nonatomic) NSString *name;
@property(nonatomic) NSString *type;
@property(nonatomic) NSString *image;
@property(nonatomic) NSString *description;

+ (Character *)characterWithDictionary:(NSDictionary *) characterDict;

@end




//
//  Character.m
//  StarWarsCells
//
//  Created by Allen Spicer on 5/4/16.
//  Copyright © 2016 Allen Spicer. All rights reserved.
//

#import "Character.h"

@implementation Character

+(Character *)characterWithDictionary:(NSDictionary *)characterDict{
    
    Character *aCharacter = nil;
    if(characterDict){
        
        aCharacter = [[Character alloc]init];
        aCharacter.name = [characterDict objectForKey:@"name"];
        aCharacter.type = [characterDict objectForKey:@"name"];
        aCharacter.image = [characterDict objectForKey:@"value"];
        aCharacter.desc = [characterDict objectForKey:@"description"];
    }
    return aCharacter;
    
}

@end




//
//  LightSideTableViewCell.h
//  StarWarsCells
//
//  Created by Allen Spicer on 5/4/16.
//  Copyright © 2016 Allen Spicer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LightSideTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet NSString *nameLabel;

//@property (weak, nonatomic) IBOutlet NSString * text;
@property (weak, nonatomic) IBOutlet UIColor * textColor;
@property (weak, nonatomic) IBOutlet UIColor * backgroundColor;






@end

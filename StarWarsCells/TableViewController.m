//
//  TableViewController.m
//  StarWarsCells
//
//  Created by Allen Spicer on 5/4/16.
//  Copyright © 2016 Allen Spicer. All rights reserved.
//

#import "TableViewController.h"
#import "UndecidedTableViewCell.h"
#import "LightSideTableViewCell.h"
#import "DarkSideTableViewCell.h"
#import "DroidTableViewCell.h"
#import "Character.h"

@interface TableViewController ()

@property NSMutableArray *characters;

@end

@implementation TableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.characters = [[NSMutableArray alloc]init];
    [self loadCharacters];
    

}


-(void) loadCharacters{

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"characters" ofType:@"json"];
    NSArray *characters = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];

    for (NSDictionary *aCharacterDictionary in characters){
        Character*someCharacter = [Character characterWithDictionary:aCharacterDictionary];
        [self.characters addObject:someCharacter];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.characters.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Character *aCharacter = self.characters[indexPath.row];
    
    if ([aCharacter.type isEqualToString:@"LightSide"]) {
        
        LightSideTableViewCell *lightSideCell = (LightSideTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"LightSideIdentifier" forIndexPath:indexPath];
        
        
        lightSideCell.nameLabel = aCharacter.name;
//        lightSideCell.textColor = [UIColor redColor];
//        lightSideCell.backgroundColor = [UIColor blackColor];
        

        return lightSideCell;
    }

    if ([aCharacter.type isEqualToString:@"DarkSide"]) {
        DarkSideTableViewCell *darkSideCell = (DarkSideTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"DarkSideIdentifier" forIndexPath:indexPath];
        darkSideCell.textLabel.text = aCharacter.name;
        darkSideCell.textLabel.textColor = [UIColor redColor];
        darkSideCell.backgroundColor = [UIColor blackColor];
        return darkSideCell;
    }
    
    if ([aCharacter.type isEqualToString:@"Undecided"]) {
        UndecidedTableViewCell *undecidedCell = (UndecidedTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"UndecidedIdentifier" forIndexPath:indexPath];
        undecidedCell.textLabel.text = aCharacter.name;
        undecidedCell.textLabel.textColor = [UIColor greenColor];
        undecidedCell.backgroundColor = [UIColor grayColor];
        return undecidedCell;
    }
    
    if ([aCharacter.type isEqualToString:@"Droid"]) {
        DroidTableViewCell *droidCell = (DroidTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"DroidIdentifier" forIndexPath:indexPath];
        droidCell.textLabel.text = aCharacter.name;
        droidCell.textLabel.textColor = [UIColor grayColor];
        droidCell.backgroundColor = [UIColor darkGrayColor];
        return droidCell;

    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"defaultCellIdentifier" forIndexPath:indexPath];
    
        cell.textLabel.text = aCharacter.name;
    cell.detailTextLabel.text = aCharacter.desc;
        //  cell.imageView.image = aCharacter.image;
      //  cell.textLabel.description = aCharacter.desc;
    
    
    
  //  @property(nonatomic) NSString *type;
 //   @property(nonatomic) NSString *image;

    
    
    
    
    return cell;
}



@end

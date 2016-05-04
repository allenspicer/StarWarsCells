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
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
        lightSideCell.textLabel.text = aCharacter.name;
        return lightSideCell;
    }

    
//    UITableViewCell *cell:
//    
//    = [tableView dequeueReusableCellWithIdentifier:@"UndecidedIdentifier" forIndexPath:indexPath];
//    
//    UITableViewCell *cell =
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DarkSideIdentifier" forIndexPath:indexPath];
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DroidIdentifier" forIndexPath:indexPath];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  ThirdViewController.h
//  PWCoreData
//
//  Created by Student P_08 on 13/02/17.
//  Copyright © 2017 Pallavi Wani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *textno;
@property (strong, nonatomic) IBOutlet UITextField *textnumber;
@property (strong, nonatomic) IBOutlet UITextField *textaddress;
@property (strong, nonatomic)NSArray *arrList;
- (IBAction)btnupdate:(id)sender;
@property (assign, nonatomic)NSInteger index;
@end

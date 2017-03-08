//
//  ViewController.h
//  PWCoreData
//
//  Created by Student P_08 on 01/02/17.
//  Copyright © 2017 Pallavi Wani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nofield;
@property (strong, nonatomic) IBOutlet UITextField *namefield;
@property (strong, nonatomic) IBOutlet UITextField *addressfield;

- (IBAction)btnActionSave:(id)sender;


@end


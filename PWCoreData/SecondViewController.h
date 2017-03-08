//
//  SecondViewController.h
//  PWCoreData
//
//  Created by Student P_08 on 13/02/17.
//  Copyright © 2017 Pallavi Wani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tbllist;
@property (strong, nonatomic)NSArray *arrayList;
@end

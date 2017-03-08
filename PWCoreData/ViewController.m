//
//  ViewController.m
//  PWCoreData
//
//  Created by Student P_08 on 01/02/17.
//  Copyright © 2017 Pallavi Wani. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "SecondViewController.h"

@interface ViewController ()
{
    NSManagedObjectContext *context;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *userdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    context = userdelegate.persistentContainer.viewContext;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnActionSave:(id)sender {
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:context];
    if([sender tag] == 1)
    {
    NSManagedObject *manageobj = [[NSManagedObject alloc]initWithEntity:entity insertIntoManagedObjectContext:context];
        [manageobj setValue:[NSNumber numberWithInteger:[_nofield .text integerValue]] forKey:@"no"];
        [manageobj setValue:_namefield.text forKey:@"name"];
        [manageobj setValue:_addressfield.text forKey:@"address"];
        [context save:nil];
    NSLog(@"%@",manageobj);
    }else{
               SecondViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
        [self.navigationController pushViewController:obj animated:YES];
        
    }
}
@end

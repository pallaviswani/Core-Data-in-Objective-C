//
//  ThirdViewController.m
//  PWCoreData
//
//  Created by Student P_08 on 13/02/17.
//  Copyright © 2017 Pallavi Wani. All rights reserved.
//

#import "ThirdViewController.h"
#import "AppDelegate.h"


@interface ThirdViewController (){
    NSManagedObjectContext *context;
}

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *delegate =(AppDelegate *) [UIApplication sharedApplication].delegate;
    context = delegate.persistentContainer.viewContext;
    NSManagedObject *manageObj = [_arrList objectAtIndex:_index];
    _textno.text = [NSString stringWithFormat:@"%@",[manageObj valueForKey:@"no"]];
    _textnumber.text = [manageObj valueForKey:@"name"];
    _textaddress.text = [manageObj valueForKey:@"address"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnupdate:(id)sender {
    NSManagedObject *manageObj = [_arrList objectAtIndex:_index];
    [manageObj setValue:[NSNumber numberWithInteger:[_textno.text integerValue]] forKey:@"no"];
    [manageObj setValue:_textnumber.text forKey:@"name"];
    [manageObj setValue:_textaddress.text forKey:@"address"];
    NSError *error;
    [context save:&error];
    if (error != nil) {
        NSLog(@"%@",error.localizedDescription);
    }

}
@end

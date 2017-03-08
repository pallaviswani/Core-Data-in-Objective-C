//
//  SecondViewController.m
//  PWCoreData
//
//  Created by Student P_08 on 13/02/17.
//  Copyright © 2017 Pallavi Wani. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"
#import "StudentTableViewCell.h"
#import "ThirdViewController.h"

@interface SecondViewController (){
    NSManagedObjectContext *context;
    NSIndexPath *selectedIndexPath;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *userdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    context = userdelegate.persistentContainer.viewContext;
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    NSFetchRequest *fetch = [[NSFetchRequest alloc]initWithEntityName:@"Student"];
    _arrayList = [context executeFetchRequest:fetch error:nil];
    [_tbllist reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrayList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StudentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[StudentTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSManagedObject *manageObj = [_arrayList objectAtIndex:indexPath.row];
    cell.Lblnumber.text =[NSString stringWithFormat:@"No:%@",[manageObj valueForKey:@"no"]] ;
    cell.Lblname.text =[NSString stringWithFormat:@"Name:%@",[manageObj valueForKey:@"name"]] ;
    
    cell.Lbladdress.text =[NSString stringWithFormat:@"Address: %@",[manageObj valueForKey:@"address"]] ;
    
    return cell;

}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row %2 == 0)
    {  return YES;
    }
    return NO;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"%ld",(long)indexPath.row);
        
        NSManagedObject *obj =[_arrayList objectAtIndex:indexPath.row];
        [context deleteObject:obj];
        NSError *error;
        [context save:nil];
        if (error != nil) {
            NSLog(@"%@",error.localizedDescription);
        }
        
        //  [context deleteObject:obj];
        NSMutableArray *array = [[NSMutableArray alloc]init];
        array = [_arrayList mutableCopy];
        [array removeObjectAtIndex:indexPath.row];
        _arrayList = [array copy];
        [_tbllist reloadData];
    }

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedIndexPath = indexPath;
    [self performSegueWithIdentifier:@"secondToThirdVC" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"secondToThirdVC"]) {
        ThirdViewController *obj = [segue destinationViewController];
        obj.arrList = _arrayList;
        obj.index = selectedIndexPath.row;
    }

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

@end

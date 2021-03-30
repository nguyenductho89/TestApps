//
//  ObjCViewController.m
//  TestApp
//
//  Created by Nguyen Duc Tho on 3/30/21.
//  Copyright © 2021 thond. All rights reserved.
//

#import "ObjCViewController.h"

@interface ObjCViewController ()

@end

@implementation ObjCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableViewCell *testView = [[UITableViewCell alloc] initWithFrame:CGRectZero];
    testView.textLabel.text = @"";
    // Do any additional setup after loading the view.
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

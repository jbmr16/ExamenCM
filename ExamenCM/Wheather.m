//
//  Wheather.m
//  ExamenCM
//
//  Created by Jose Maciel on 8/27/16.
//  Copyright © 2016 Jose Maciel. All rights reserved.
//

#import "Wheather.h"

@interface Wheather ()

@end

@implementation Wheather

- (void)viewDidLoad {
    [super viewDidLoad];
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

/**********************************************************************************************/
#pragma mark - Action methods
/**********************************************************************************************/
- (IBAction)btnLoadPressed:(id)sender {
    if (![self.txtLatitude.text isEqual:@""] && ![self.txtLongitude.text isEqual:@""]) {
        [self qeueLoadData];
    }
    else {
        self.lblCityValue.text = @"Error, campo vacío";
    }
    
}

@end

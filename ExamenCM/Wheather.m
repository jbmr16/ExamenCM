//
//  Wheather.m
//  ExamenCM
//
//  Created by Jose Maciel on 8/27/16.
//  Copyright © 2016 Jose Maciel. All rights reserved.
//

#import "Wheather.h"

@interface Wheather (){
@private NSString *strLat;
@private NSString *strLng;
}

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
    

     strLat = [NSString stringWithFormat:@"%f", lat];
     strLng = [NSString stringWithFormat:@"%f", lng];
    
    
    if (![strLat isEqual:@""] && ![strLng  isEqual:@""]) {
        [self qeueLoadData];
    }
    else {
        self.lblcity.text = @"Error, campo vacío";
    }
    
}



/**********************************************************************************************/
#pragma mark - Task methods
/**********************************************************************************************/
- (void)qeueLoadData {
    [UIApplication sharedApplication].networkActivityIndicatorVisible   = YES;
    [self.activityLoad startAnimating];
    
    NSOperationQueue *queue         = [NSOperationQueue new];
    NSInvocationOperation *opGet    = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(loadData) object:nil];
    [queue addOperation:opGet];
    
    NSInvocationOperation *opDidGet = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(didLoadData) object:nil];
    [opDidGet addDependency:opGet];
    [queue addOperation:opDidGet];
}
//----------------------------------------------------------------------------------------------
- (void)loadData {
    mjsonGeo                        = [WebServices getWeatherWithLatitude:strLat AndLongitude:strLng];
    
}

/**/
- (void)didLoadData {
    dispatch_async(dispatch_get_main_queue(), ^{
        ObjectResponse *object          = [Parser parseGeoObject];

        
        NSString *stName                = object.name;
        MainObject *mainObject          = object.main;
        float tempCelsius               = mainObject.temp - 273.15;
        float tempCelsiusMax            = mainObject.temp_min - 273.15;
        float tempCelsiusMin            = mainObject.temp_max - 273.15;

        self.lbllat.text = strLat;
        self.lbllng.text= strLng;
        self.lbltemp.text          = [NSString stringWithFormat:@"%.1f", tempCelsius];
        self.lbltemp.text          = [self.lbltemp.text  stringByAppendingString:@" ºC"];
        self.lblhumi.text      = [NSString stringWithFormat:@"%f", mainObject.humidity];
        self.lbltempmin.text          = [NSString stringWithFormat:@"%.1f", tempCelsiusMax];
        self.lbltempmax.text          = [NSString stringWithFormat:@"%.1f", tempCelsiusMin];
        self.lbltempmin.text          = [self.lbltempmin.text  stringByAppendingString:@" ºC"];
        self.lbltempmax.text          = [self.lbltempmax.text  stringByAppendingString:@" ºC"];
        self.lblcity.text          = stName;
        self.lblpressure.text      = [NSString stringWithFormat:@"%f", mainObject.pressure];

 
        
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible   = NO;
        [self.activityLoad stopAnimating];
    });
}

@end

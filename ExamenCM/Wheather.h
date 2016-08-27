//
//  Wheather.h
//  ExamenCM
//
//  Created by Jose Maciel on 8/27/16.
//  Copyright © 2016 Jose Maciel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebServices.h"
#import "Declarations.h"
#import "Start.h"

@interface Wheather : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *lblcity;
@property (strong, nonatomic) IBOutlet UILabel *lblhumi;
@property (strong, nonatomic) IBOutlet UILabel *lbltemp;
@property (strong, nonatomic) IBOutlet UILabel *lbltempmin;
@property (strong, nonatomic) IBOutlet UILabel *lbltempmax;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityLoad;
@property (strong, nonatomic) IBOutlet UILabel *lbllat;
@property (strong, nonatomic) IBOutlet UILabel *lbllng;
@property (strong, nonatomic) IBOutlet UIButton *buttonLoad;
@property (strong, nonatomic) IBOutlet UILabel *lblpressure;
@property (strong, nonatomic) IBOutlet UILabel *lblwth;

@end

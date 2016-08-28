//
//  ShopDetails.h
//  ExamenCM
//
//  Created by Jose Maciel on 8/28/16.
//  Copyright © 2016 Jose Maciel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayPalMobile.h"

@interface ShopDetails : UIViewController <PayPalPaymentDelegate>


@property NSString *shopTitleSelected;
@property NSString *shopPhotoSelected;
@property NSString *shopDetailsSelected;
@property NSString *shopPriceSelected;
@property NSString *cool;


@property (strong, nonatomic) IBOutlet UIImageView *lblimg;

@property (strong, nonatomic) IBOutlet UILabel *lbldesc;

@property (strong, nonatomic) IBOutlet UILabel *lblPrice;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;

@end

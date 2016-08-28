//
//  MainShop.m
//  ExamenCM
//
//  Created by Jose Maciel on 8/27/16.
//  Copyright © 2016 Jose Maciel. All rights reserved.
//

#import "MainShop.h"

@interface MainShop ()
@property NSMutableArray *shopTitles;
@property NSMutableArray *shopPhotos;
@property NSMutableArray *shopDetails;
@property NSMutableArray *shopPrice;
@property NSString *stTitleSelected;
@property NSString *stPhotoSelected;
@property NSString *stDetails;
@property NSString *stPrice;
@end

@implementation MainShop

- (void)viewDidLoad {
    [super viewDidLoad];
  [self initController]; 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)initController {
    self.shopTitles   = [[NSMutableArray alloc] initWithObjects: @"Lacoste Shoes", @"Lacoste Jacket", @"Lacoste Necklace", @"Lacoste Pants",@"Lacoste Polo Shirt",nil];
    self.shopPhotos   = [[NSMutableArray alloc] initWithObjects: @"zap.jpg", @"cham.jpg", @"col.jpg", @"pant.jpg",@"cam.jpg",nil];
    self.shopDetails   = [[NSMutableArray alloc] initWithObjects: @"Crafted in beautiful 100% cotton gabardine, these chinos are as comfortable as they are colorful. A smart, casual design to wear with a striped shirt or polo from the collection.", @"Graduate to style this season with the college spirit of this Lacoste Live jacket in cotton flannel. Takes midseason fashion to an unprecedented degree.", @"Lacoste Necklace CROC 700930199, Color: Cerise, Size: One Size ", @"Crafted in beautiful 100% cotton gabardine, these chinos are as comfortable as they are colorful. A smart, casual design to wear with a striped shirt or polo from the collection.",@"Iconic, this slim fit Lacoste Live polo is crafted in durable 100% cotton mini piqué. An essential in all athletic wardrobes for comfort and freedom of movement. ",nil];
     self.shopPrice   = [[NSMutableArray alloc] initWithObjects: @"USD:40.00", @"USD:120.00", @"USD:15.00", @"USD:35.00",@"USD:25.00",nil];
    
 }
/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.shopTitles.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    cellHome *cell = (cellHome *)[tableView dequeueReusableCellWithIdentifier:@"cellHome"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellHome" bundle:nil] forCellReuseIdentifier:@"cellHome"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellHome"];
    }
    //Fill cell with info from arrays
    cell.lblprod.text = self.shopTitles[indexPath.row];
    
    cell.lblimg.image =[UIImage imageNamed:self.shopPhotos[indexPath.row]];
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.stTitleSelected = self.shopTitles[indexPath.row];
    self.stPhotoSelected = self.shopPhotos[indexPath.row];
    self.stDetails = self.shopDetails[indexPath.row];
    self.stPrice = self.shopPrice[indexPath.row];
    
    
    [self performSegueWithIdentifier:@"shopSelect" sender:self];
}

//--------------
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[ShopDetails class]]) {
        ShopDetails *destination     = [segue destinationViewController];
        destination.shopTitleSelected        = self.stTitleSelected;
        destination.shopPhotoSelected        = self.stPhotoSelected;
        destination.shopDetailsSelected = self.stDetails;
        destination.shopPriceSelected = self.stPrice;
        
    }
}
//-------------------------------------------------------------------------------
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    //1. Setup the CATransform3D structure
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
    rotation.m34 = 1.0/ -600;
    
    //2. Define the initial state (Before the animation)
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    
    cell.layer.transform = rotation;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    
    //3. Define the final state (After the animation) and commit the animation
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.4];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    
    //Reassure that cell its in its place (WaGo)
    cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
    [UIView commitAnimations];
}

@end

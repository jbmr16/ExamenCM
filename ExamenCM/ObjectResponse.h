//
//  GeoApi.h
//  ExamenCM
//
//  Created by Jose Maciel on 8/27/16.
//  Copyright © 2016 Jose Maciel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coord.h"
#import "MainObject.h"  
#import "Pais.h"


@interface ObjectResponse : NSObject

@property (nonatomic,strong) Coord *coord;

@property (nonatomic,strong) MainObject *main;

@property (nonatomic,strong) Pais *sys;

@property (nonatomic,strong) NSString *name;




@end

//
//  ViewController.h
//  Tester
//
//  Created by Thomas Langford on 8/28/12.
//  Copyright (c) 2012 DoItLive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Connection.h"

@interface ViewController : UIViewController

-(void)response:(NSData*)receivedData;
-(void)checkForPartner;

@end

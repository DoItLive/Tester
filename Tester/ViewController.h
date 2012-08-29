//
//  ViewController.h
//  Tester
//
//  Created by Thomas Langford on 8/28/12.
//  Copyright (c) 2012 DoItLive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Connection.h"

@interface ViewController : UIViewController {

    UIButton *syncButton;
    UILabel *dirLabel;
    
    
}
-(void)response:(NSData*)receivedData;
-(void)checkForPartner;



@property (nonatomic) IBOutlet UIButton *syncButton;
@property (nonatomic) IBOutlet UILabel *dirLabel;


-(IBAction)syncButtonPressed:(id)sender;



@end


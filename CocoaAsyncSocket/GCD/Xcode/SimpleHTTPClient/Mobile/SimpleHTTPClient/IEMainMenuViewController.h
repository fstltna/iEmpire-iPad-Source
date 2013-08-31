//
//  IEMainMenuViewController.h
//  iEmpire
//
//  Created by Dhaval Karwa on 4/9/13.
//
//

#import <UIKit/UIKit.h>

@interface IEMainMenuViewController : UIViewController
{
    NSArray *_IAPProducts;
}

// IAP
@property (weak, nonatomic) IBOutlet UIButton *unlockFeaturesButton;
- (IBAction)unlockFeatures:(id)sender;
//

@end

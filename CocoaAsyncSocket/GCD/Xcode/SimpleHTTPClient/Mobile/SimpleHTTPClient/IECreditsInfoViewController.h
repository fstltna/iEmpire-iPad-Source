//
//  IECreditsInfoViewController.h
//  iEmpire
//
//  Created by Dhaval Karwa on 9/3/13.
//
//

#import <UIKit/UIKit.h>

@interface IECreditsInfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *infoWebView;
@property (nonatomic, copy) NSString *urlString;
@end

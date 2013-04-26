//
//  IEServersSearchViewController.h
//  iEmpire
//
//  Created by Dhaval Karwa on 4/9/13.
//
//

#import <UIKit/UIKit.h>

@interface IEServersSearchViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *serverName;
@property (weak, nonatomic) IBOutlet UITextField *serverPort;
@property (weak, nonatomic) IBOutlet UITextField *countryName;
@property (weak, nonatomic) IBOutlet UITextField *password;

- (IBAction)connectPressed:(id)sender;

@end

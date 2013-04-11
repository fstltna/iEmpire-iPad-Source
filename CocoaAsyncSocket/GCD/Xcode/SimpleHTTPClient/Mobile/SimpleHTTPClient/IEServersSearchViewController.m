//
//  IEServersSearchViewController.m
//  iEmpire
//
//  Created by Dhaval Karwa on 4/9/13.
//
//

#import "IEServersSearchViewController.h"
#import "IEGamePlayScreenViewController.h"

@interface IEServersSearchViewController ()

@property (weak, nonatomic) IBOutlet UITableView *searchResults;
@property (strong, nonatomic) IBOutlet NSMutableArray *searchItems;

@end

@implementation IEServersSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"In Servers Search");
    _searchItems = [NSMutableArray array];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tableView methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [_searchItems count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

//currently iniitalizing the view controller to bring up the gameplay controller
    IEGamePlayScreenViewController *gamePlayCtrl = [[UIStoryboard storyboardWithName:@"MainStory-iPad" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"iEGamePlay"];
    
    [self presentViewController:gamePlayCtrl
                       animated:YES
                     completion:NULL];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *CellIdentifier = @"Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSString *text = [NSString stringWithFormat:@"%@",[self.searchItems objectAtIndex:[indexPath row]]];
	cell.textLabel.text = text;
    return cell;
}

#pragma mark -

- (IBAction)connectPressed:(id)sender {

    //generating random number
    //fillin the searchItems with that
    int random = arc4random() %10 +1;
    for (int i=0; i<random; i++) {
        [_searchItems addObject:@(i)];
    }
    //reload table data
    [self.searchResults reloadData];
}
@end

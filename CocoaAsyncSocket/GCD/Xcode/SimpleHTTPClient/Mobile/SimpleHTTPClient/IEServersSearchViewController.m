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
@property (nonatomic, weak) UILongPressGestureRecognizer *longReco;

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
    
    UILongPressGestureRecognizer *reco = [[UILongPressGestureRecognizer alloc]initWithTarget:self
                                                                                      action:@selector(handleLongPress:)];
    [self.searchResults addGestureRecognizer:reco];
    _longReco = reco;
    
    _searchItems = [NSMutableArray array];
    _searchResults.delegate = self;
    _searchResults.dataSource = self;
    _searchResults.bounces = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tableView methods

-(void)handleLongPress:(UILongPressGestureRecognizer *)reco{

    if (reco.state ==UIGestureRecognizerStateBegan) {

        [_searchResults setEditing:YES animated:YES];
    }
    else if (reco.state == (UIGestureRecognizerStateEnded | UIGestureRecognizerStateCancelled | UIGestureRecognizerStateFailed)){
    
        [_searchResults setEditing:NO animated:YES];
    }
}

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

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{

//    Use this to stop moving of certain rows
    NSLog(@"returning yes...");
    return YES;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{

    NSNumber *obj = [[self.searchItems objectAtIndex:[sourceIndexPath row]]copy];
    [self.searchItems removeObjectAtIndex:[sourceIndexPath row]];
    [self.searchItems insertObject:obj atIndex:[destinationIndexPath row]];
    
    [tableView setEditing:NO animated:YES];
    
    NSLog(@"trying...");
}

//-(UITableViewCellEditingStyle )tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    return UITableViewCellEditingStyle;
//}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{

    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"editing style for row %d is %d",[indexPath row], editingStyle);
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.searchItems removeObjectAtIndex:[indexPath row]];
        
        [_searchResults reloadData];
    }
}

#pragma mark -

- (IBAction)connectPressed:(id)sender {

    //generating random number
    //fillin the searchItems with that
    _searchItems = [NSMutableArray array];
    int random = arc4random() %10 +1;
    for (int i=0; i<random; i++) {
        [_searchItems addObject:@(i)];
    }
    //reload table data
    [self.searchResults reloadData];
}
@end

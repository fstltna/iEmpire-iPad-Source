//
//  IEServersStore.h
//  iEmpire
//
//  Created by Dhaval Karwa on 4/25/13.
//
//


//Contains a dictionary of servers with
//Key: Server Name
//Value: Port, Country Name, Password

extern NSString *const kServername;
extern NSString *const kServerCountry;
extern NSString *const kServerPassword;
extern NSString *const kServerPort;

#import <Foundation/Foundation.h>

@interface IEServersStore : NSObject

+(IEServersStore *)sharedServersStore;

-(void)addServerEntryToStore:(NSDictionary *)serverEntry;

-(NSArray *)serversList;

@end

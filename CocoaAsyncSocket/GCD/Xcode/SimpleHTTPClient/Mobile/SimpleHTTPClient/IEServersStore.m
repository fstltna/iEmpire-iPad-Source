//
//  IEServersStore.m
//  iEmpire
//
//  Created by Dhaval Karwa on 4/25/13.
//
//

#import "IEServersStore.h"
#import "IEServerObject.h"


 NSString *const kServername = @"Name";
 NSString *const kServerCountry = @"Country";
 NSString *const kServerPassword = @"Password";
 NSString *const kServerPort = @"Port";

@interface IEServersStore ()

@property (nonatomic, strong) NSMutableDictionary *serversDict;

@end

@implementation IEServersStore

+(IEServersStore *)sharedServersStore{

    static IEServersStore *instance = nil;

    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

-(id)init{

    self = [super init];
    if (self) {

        _serversDict = [NSMutableDictionary dictionaryWithCapacity:1];
    }
    return self;
}

-(void)addServerEntryToStore:(NSDictionary *)serverEntry{

    //if the entry exists and there are three values for the key
    //add it to the store
    if (serverEntry && [[serverEntry allValues] count] >=3) {
        
        IEServerObject *serverObj = [IEServerObject serverObjectWithName:serverEntry[kServername]
                                                                 country:serverEntry[kServerCountry]
                                                                    port:[serverEntry[kServerPort] integerValue]
                                                                password:serverEntry[kServerPassword]];
        
        [_serversDict setValue:serverObj forKey:serverEntry[kServername]];
    }
}

-(NSArray *)serversList{

    if ([_serversDict count]) {
        return [[_serversDict allValues]copy];
    }
    return nil;
}

@end

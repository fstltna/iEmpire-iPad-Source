//
//  IEServerObject.m
//  iEmpire
//
//  Created by Dhaval Karwa on 4/25/13.
//
//

#import "IEServerObject.h"

@interface IEServerObject ()

@end

@implementation IEServerObject

+(IEServerObject *)serverObjectWithName:(NSString *)name country:(NSString *)countryName port:(int)portNum password:(NSString *)password{

    return [[self alloc]initWithName:name country:countryName port:portNum password:password];
}

-(id)initWithName:(NSString *)name country:(NSString *)countryName port:(int)portNum password:(NSString *)password{

    self = [super init];
    if (self) {
        
        _serverName = name;
        _country = countryName;
        _password = password;
        _port = portNum;
    }
    return self;
}

@end

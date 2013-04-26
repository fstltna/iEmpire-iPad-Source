//
//  IEServerObject.h
//  iEmpire
//
//  Created by Dhaval Karwa on 4/25/13.
//
//

#import <Foundation/Foundation.h>

@interface IEServerObject : NSObject

@property (nonatomic, copy, readonly) NSString *serverName;
@property (nonatomic, copy, readonly) NSString *password;
@property (nonatomic, copy, readonly) NSString *country;
@property (nonatomic, assign, readonly) int port;

+(IEServerObject *)serverObjectWithName:(NSString *)name country:(NSString *)countryName port:(int)portNum password:(NSString *)password;

@end

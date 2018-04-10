//
//  RNCacheModules.h
//  XYVivaLite_TemplateLibrary
//
//  Created by 夏敏 on 09/02/2018.
//

#import <Foundation/Foundation.h>

@interface RNCacheModules : NSObject

+ (RNCacheModules *)shareInstance;

- (void)registerModule:(id)module withIdentifier:(NSString *)identifier;

- (id)moduleWithIdentifier:(NSString *)identifier;

@end

//
//  RNCacheModules.m
//  XYVivaLite_TemplateLibrary
//
//  Created by 夏敏 on 09/02/2018.
//

#import "RNCacheModules.h"

@interface RNCacheModules()

@property (nonatomic,strong) NSMapTable  *cacheMap;

@end

@implementation RNCacheModules

+ (RNCacheModules *)shareInstance {
    static dispatch_once_t once;
    static RNCacheModules *module;
    dispatch_once(&once, ^{
        module = [[RNCacheModules alloc] init];
    });
    return module;
}

- (void)registerModule:(id)module withIdentifier:(NSString *)identifier {
    [self.cacheMap setObject:module forKey:identifier];
}

- (id)moduleWithIdentifier:(NSString *)identifier {
    return [self.cacheMap objectForKey:identifier];
}

- (NSMapTable *)cacheMap {
    if(nil == _cacheMap){
        _cacheMap = [NSMapTable strongToWeakObjectsMapTable];
    }
    return _cacheMap;
}

@end

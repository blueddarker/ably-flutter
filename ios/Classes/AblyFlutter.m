@import Ably;

#import "AblyFlutter.h"
#import "AblyFlutterMessage.h"
#import "AblyFlutterClientOptions.h"
#import "codec/AblyPlatformConstants.h"
#import <ably_flutter/ably_flutter-Swift.h>


@implementation AblyFlutter {
    NSMutableDictionary<NSNumber *, ARTRealtime *>* _realtimeInstances;
    NSMutableDictionary<NSNumber *, ARTRest *>* _restInstances;
    NSMutableDictionary<NSNumber *, ARTPaginatedResult *>* _paginatedResults;
    long long _nextHandle;
}

+ (instancetype)sharedInstance {
    static AblyFlutter *sharedInstance = nil;
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [[self alloc] init];
        }
    }
    return sharedInstance;
}

-(NSNumber *) getNextHandle {
    return @(_nextHandle++);
}

-(instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _realtimeInstances = [NSMutableDictionary new];
    _restInstances = [NSMutableDictionary new];
    _paginatedResults = [NSMutableDictionary new];
    _nextHandle = 1;
    
    return self;
}

-(void)setRest:(ARTRest *const)rest with:(NSNumber *const)handle {
    [_restInstances setObject:rest forKey:handle];
}

-(ARTRest *)getRest:(NSNumber *const)handle {
    return [_restInstances objectForKey:handle];
}

-(void)setRealtime:(ARTRealtime *const)realtime with:(NSNumber *const)handle {
    [_realtimeInstances setObject:realtime forKey:handle];
}

-(ARTRealtime *)realtimeWithHandle:(NSNumber *const)handle {
    return [_realtimeInstances objectForKey:handle];
}

-(NSNumber *)setPaginatedResult:(ARTPaginatedResult *const)result handle:(NSNumber *) handle {
    if(!handle){
        handle = @(_nextHandle++);
    }
    [_paginatedResults setObject:result forKey:handle];
    return handle;
}

-(ARTPaginatedResult *) getPaginatedResult:(NSNumber *const) handle {
    return [_paginatedResults objectForKey:handle];
}

-(void)reset {
    for (ARTRealtime *const r in _realtimeInstances.allValues) {
        [r close];
    }
    [_realtimeInstances removeAllObjects];
    [_restInstances removeAllObjects];
}

@end

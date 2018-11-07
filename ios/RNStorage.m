#import "RNStorage.h"

@implementation RNStorage

@synthesize bridge = _bridge;

RCT_EXPORT_MODULE()

- (dispatch_queue_t) methodQueue
{
  return dispatch_get_main_queue();
}

+ (BOOL) requiresMainQueueSetup
{
  return YES;
}

RCT_EXPORT_METHOD(setArrayForKey:(NSArray*)array
                  key:(NSString*)key)
{
  if (array && key) {
    [[NSUserDefaults standardUserDefaults] setObject:array forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
  }
}

RCT_EXPORT_METHOD(setStringForKey:(NSString*)string
                  key:(NSString*)key)
{
  if (string && key) {
    [[NSUserDefaults standardUserDefaults] setObject:string forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
  }
}

RCT_EXPORT_METHOD(setObjectForKey:(NSDictionary*)object
                  key:(NSString*)key)
{
  if (object && key) {
    [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
  }
}

RCT_EXPORT_METHOD(setLongForKey:(NSInteger)number
                  key:(NSString*)key)
{
  if (key) {
    [[NSUserDefaults standardUserDefaults] setInteger:number forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
  }
}

RCT_EXPORT_METHOD(setDoubleForKey:(double)number
                  key:(NSString*)key)
{
  if (key) {
    [[NSUserDefaults standardUserDefaults] setDouble:number forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
  }
}

RCT_EXPORT_METHOD(setBoolForKey:(BOOL)boolValue
                  key:(NSString*)key)
{
  if (key) {
    [[NSUserDefaults standardUserDefaults] setBool:boolValue forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
  }
}

RCT_EXPORT_METHOD(arrayForKey:(NSString*)key
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
  NSArray* array = [[NSUserDefaults standardUserDefaults] arrayForKey:key];
  if (array) {
    resolve(array);
  }
  else {
    reject(@"-1", @"不存在array", nil);
  }
}

RCT_EXPORT_METHOD(stringForKey:(NSString*)key
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
  NSString* string = [[NSUserDefaults standardUserDefaults] stringForKey:key];
  if (string) {
    resolve(string);
  }
  else {
    reject(@"-1", @"不存在string", nil);
  }
}

RCT_EXPORT_METHOD(objectForKey:(NSString*)key
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
  id object = [[NSUserDefaults standardUserDefaults] objectForKey:key];
  if (object) {
    resolve(object);
  }
  else {
    reject(@"-1", @"不存在object", nil);
  }
}

RCT_EXPORT_METHOD(longForKey:(NSString*)key
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
  NSInteger number = [[NSUserDefaults standardUserDefaults] integerForKey:key];
  resolve([NSNumber numberWithInteger:number]);
}

RCT_EXPORT_METHOD(doubleForKey:(NSString*)key
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
  double number = [[NSUserDefaults standardUserDefaults] doubleForKey:key];
  resolve([NSNumber numberWithDouble:number]);
}

RCT_EXPORT_METHOD(boolForKey:(NSString*)key
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
  BOOL number = [[NSUserDefaults standardUserDefaults] boolForKey:key];
  resolve([NSNumber numberWithBool:number]);
}

RCT_EXPORT_METHOD(removeItemForKey:(NSString*)key)
{
  if (key) {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
  }
}

@end

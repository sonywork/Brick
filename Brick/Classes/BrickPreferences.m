#import "BrickPreferences.h"

const NSString *DebugFlag = @"debug";

@implementation BrickPreferences

# pragma mark Initialization

+ (void) loadDefaults {
  NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Defaults" ofType:@"plist"];
  NSDictionary *defaults = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
  [Log debug:@"Registering default preferences..."];
  [[self backend] registerDefaults:defaults];
}

# pragma mark Public Getters

+ (BOOL) debugMode {
  return [[self backend] boolForKey:(NSString*)DebugFlag];
}

# pragma mark Public Setters

+ (void) toggleDebugMode {
  if (self.debugMode) {
    [Log debug:@"Deactivating Debug Mode..."];
    //[self removeObjectForKey:(NSString*)DebugFlag];
  } else {
    [Log debug:@"Activating Debug Mode..."];
    //[self setObject:DebugFlag forKey:(NSString*)DebugFlag];
  }
}

# pragma mark Internal Getters

+ (NSUserDefaults*) backend {
  return [NSUserDefaults standardUserDefaults];
}

@end
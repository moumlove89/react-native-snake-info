#import "RNSnakeInfo.h"

@implementation RNSnakeInfo

static RNSnakeInfo *instance = nil;

+ (instancetype)shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
  });
  return instance;
}

- (NSString *)getBundleId {
    NSBundle *mb = [NSBundle mainBundle];
    return [mb objectForInfoDictionaryKey:@"CFBundleIdentifier"];
}

- (NSString *)getValueFromKey:(NSString *)key {
    NSBundle *mb = [NSBundle mainBundle];
    NSDictionary *dict = [mb objectForInfoDictionaryKey:@"com.hangzhou"];
    return [dict objectForKey:key];
}

- (NSDictionary *)dictFromQueryString:(NSString *)queryString {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSArray *pairs = [queryString componentsSeparatedByString:@"&"];
    for (NSString *pair in pairs) {
        NSArray *elements = [pair componentsSeparatedByString:@"="];
        if ([elements count] > 1) {
            [dict setObject:[elements objectAtIndex:1]
                     forKey:[elements objectAtIndex:0]];
        }
    }
    return dict;
}

- (void)saveValueForAff:(NSString * _Nullable)affC {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:affC forKey:@"affCode"];
    [ud setObject:[self getValueFromKey:@"appVersion"] forKey:@"appVersion"];
    [ud setObject:[self getValueFromKey:@"deploymentKey"] forKey:@"deploymentKey"];
    [ud setObject:[self getValueFromKey:@"serverUrl"] forKey:@"serverUrl"];
    [ud setBool:YES forKey:[self getBundleId]];
    [ud synchronize];
}



@end

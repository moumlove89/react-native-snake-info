#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNSnakeInfo : NSObject

+ (instancetype)shared;
- (NSString *)getBundleId;
- (NSString *)getValueFromKey:(NSString *)key;
- (void)saveValueForAff:(NSString * _Nullable)affC;
- (NSDictionary *)dictFromQueryString:(NSString *)queryString;

@end

NS_ASSUME_NONNULL_END

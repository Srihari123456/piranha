//  Based on the examples provided by Nicholas Lauer

#import <Foundation/Foundation.h>
#import <objc/runtime.h>


@protocol UBAdvancedExperimenting

- (BOOL)optimisticFeatureFlagEnabledForExperiment:(NSString *)experimentKey;

@end

#define UBOptimisticNamedFeatureFlagIsEnabled(flagName) ([UBOptimisticFeatureFlag isEnabled:@ #flagName])

#define UBOptimisticNamedFeatureFlag(flagName) \
    if (UBOptimisticNamedFeatureFlagIsEnabled(flagName))


@interface UBOptimisticFeatureFlag : NSObject
@property (class, nonatomic) id<UBAdvancedExperimenting> advancedExperiments;
+ (BOOL)isEnabled:(NSString *)flagName;
@end

@implementation UBOptimisticFeatureFlag

+ (BOOL)isEnabled:(NSString *)flagName
{
}

@end


@implementation OptimisticTest

- (void)optimisticFeatureFlag_macro {
  UBOptimisticNamedFeatureFlag(optimistic_stale_flag) {
    NSLog(@"1");
  }
  else {
    NSLog(@"2");
  }
}

@end

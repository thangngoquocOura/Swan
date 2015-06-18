//
//  UIBezierPath+Swan.h
//  SwanBridge
//
//  Created by Antti Laitala on 18/06/15.
//
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (Swan)

/** Returns a new bezier path by smoothing the points using Catmull-Rom with provided `granularity`. */
- (nonnull UIBezierPath *)smoothedPathUsingGranularity:(NSUInteger)granularity;

@end

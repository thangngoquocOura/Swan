//
//  UIBezierPath+Swan.m
//  SwanBridge
//
//  Created by Antti Laitala on 18/06/15.
//
//

#import "UIBezierPath+Swan.h"

static void inline getPointsFromElement(void *info, const CGPathElement *element)
{
    NSMutableArray *bezierPoints = (__bridge NSMutableArray *)info;
    
    CGPathElementType type = element->type;
    CGPoint *points = element->points;
    
    if (type != kCGPathElementCloseSubpath)
    {
        [bezierPoints addObject:[NSValue valueWithCGPoint:points[0]]];
        if ((type != kCGPathElementAddLineToPoint) && (type != kCGPathElementMoveToPoint))
            [bezierPoints addObject:[NSValue valueWithCGPoint:points[1]]];
    }
    
    // Points at indices 0 and 1 are the control points, so ignore those.
    if (type == kCGPathElementAddCurveToPoint)
        [bezierPoints addObject:[NSValue valueWithCGPoint:points[2]]];
}

static inline NSMutableArray *pointsFromPath(UIBezierPath *path)
{
    NSMutableArray *points = [NSMutableArray new];
    CGPathApply(path.CGPath, (__bridge void *)points, getPointsFromElement);
    return points;
}

static void inline getIsSubPathClosed(void *info, const CGPathElement *element)
{
    BOOL *closed = (BOOL *)info;
    CGPathElementType type = element->type;
    
    if (type == kCGPathElementCloseSubpath)
        *closed = YES;
}

static BOOL inline isPathClosed(UIBezierPath *path)
{
    BOOL closed = NO;
    CGPathApply(path.CGPath, (void *)&closed, getIsSubPathClosed);
    return closed;
}

@implementation UIBezierPath (Swan)

- (UIBezierPath *)smoothedPathUsingGranularity:(NSUInteger)granularity
{
    NSMutableArray *points = pointsFromPath(self);
    const NSUInteger count = points.count;
    if (count < 4)
        return self;
    
    BOOL pathIsClosed = isPathClosed(self);
    if (!pathIsClosed) {
        // Duplicate the first and last points to act as control points for open paths.
        [points insertObject:[points objectAtIndex:0] atIndex:0];
        [points addObject:[points lastObject]];
    }
    
    UIBezierPath *smoothedPath = [UIBezierPath bezierPath];
    smoothedPath.lineWidth = self.lineWidth;
    
    [smoothedPath moveToPoint:[points[0] CGPointValue]];
    
    if (!pathIsClosed)
        [smoothedPath addLineToPoint:[points[1] CGPointValue]];
    
    const NSUInteger start = pathIsClosed ? 2 : 3;
    const NSUInteger end = pathIsClosed ? points.count + 2 : points.count;
    
    for (NSUInteger index = start; index < end; index++) {
        CGPoint p0 = [points[(points.count + index - 3) % count] CGPointValue];
        CGPoint p1 = [points[(points.count + index - 2) % count] CGPointValue];
        CGPoint p2 = [points[(points.count + index - 1) % count] CGPointValue];
        CGPoint p3 = [points[index % count] CGPointValue];
        
        // Interpolate from p1 to p2 using Catmull-Rom splines.
        // http://en.wikipedia.org/wiki/Cubic_Hermite_spline#Catmull.E2.80.93Rom_spline
        for (CGFloat i = 1; i < granularity; i++) {
            CGFloat t = i * (1.0 / granularity);
            CGFloat tt = t * t;
            CGFloat ttt = tt * t;
            
            CGPoint pi;
            pi.x = 0.5 * (2 * p1.x + (p2.x - p0.x) * t + (2 * p0.x - 5 * p1.x + 4 * p2.x - p3.x) *tt + (3 * p1.x - p0.x - 3 * p2.x + p3.x) * ttt);
            pi.y = 0.5 * (2 * p1.y + (p2.y - p0.y) * t + (2 * p0.y - 5 * p1.y + 4 * p2.y - p3.y) *tt + (3 * p1.y - p0.y - 3 * p2.y + p3.y) * ttt);
            [smoothedPath addLineToPoint:pi];
        }
        [smoothedPath addLineToPoint:p2];
    }
    
    if (pathIsClosed) {
        [smoothedPath closePath];
    } else {
        [smoothedPath addLineToPoint:[points[points.count - 1] CGPointValue]];
    }
    
    return smoothedPath;
}

@end

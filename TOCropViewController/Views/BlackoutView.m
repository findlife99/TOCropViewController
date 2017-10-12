//
//  BlackoutView.m
//  MENU
//
//  Created by 楊育宗 on 2015/11/26.
//
//

#import "BlackoutView.h"

@implementation BlackoutView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
     CGContextRef context = UIGraphicsGetCurrentContext();
     CGContextSetBlendMode(context, kCGBlendModeDestinationOut);

     for (NSValue *value in self.framesToCutOut) {
         CGRect pathRect = [value CGRectValue];
         UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:pathRect];
         [path fill];
     }

     for (NSValue *value in self.rectsToCutOut) {
         CGRect pathRect = [value CGRectValue];
         CGContextFillRect(context, pathRect);
     }


     CGContextSetBlendMode(context, kCGBlendModeNormal);
 }

@end

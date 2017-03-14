//
//  GRMParallaxImageView.m
//  GRMParallaxImageView
//
//  Created by Shakhzod Ikromov on 3/13/17.
//  Copyright © 2017 Shakhzod Ikromov. All rights reserved.
//

#import "GRMParallaxImageView.h"

#define CLIP(VALUE, VALUE_MIN, VALUE_MAX) (MIN(VALUE_MAX, MAX(VALUE_MIN, VALUE)))

@interface GRMParallaxImageView ()

@end

@implementation GRMParallaxImageView

#pragma mark - Initialization
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}

#pragma mark - Public setters
- (void)setTiltX:(CGFloat)tiltX {
    _tiltX = CLIP(tiltX, 0.0, 1.0);
    [self setNeedsDisplay];
}

- (void)setTiltY:(CGFloat)tiltY {
    _tiltY = CLIP(tiltY, 0.0, 1.0);
    [self setNeedsDisplay];
}

- (void)setImage:(UIImage *)image {
    _image = image;
    [self setNeedsDisplay];
}

- (void)setDepthX:(CGFloat)depthX {
    _depthX = depthX;
    [self setNeedsDisplay];
}

- (void)setDepthY:(CGFloat)depthY {
    _depthY = depthY;
    [self setNeedsDisplay];
}

#pragma mark - Drawing
- (void)drawRect:(CGRect)rect {
    if (!self.image) {
        return;
    }
    
    rect = CGRectInset(rect, -self.depthX, -self.depthY);
    
    CGFloat tX, tY;
    tX = -self.depthX * self.tiltX * 2.0;
    tY = -self.depthY * self.tiltY * 2.0;
    
    rect = CGRectMake(tX, tY, CGRectGetWidth(rect), CGRectGetHeight(rect));
    
    [self.image drawInRect:rect];
}


@end

#undef CLIP

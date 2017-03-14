//
//  GRMParallaxImageView.h
//  GRMParallaxImageView
//
//  Created by Shakhzod Ikromov on 3/13/17.
//  Copyright © 2017 Shakhzod Ikromov. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface GRMParallaxImageView : UIView

@property (nullable, readwrite, nonatomic) IBInspectable UIImage *image;
@property (          readwrite, nonatomic) IBInspectable CGFloat depthX;
@property (          readwrite, nonatomic) IBInspectable CGFloat depthY;
@property (          readwrite, nonatomic) IBInspectable CGFloat tiltX;
@property (          readwrite, nonatomic) IBInspectable CGFloat tiltY;

@end

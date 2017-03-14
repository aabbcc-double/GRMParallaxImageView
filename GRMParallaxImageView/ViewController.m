//
//  ViewController.m
//  GRMParallaxImageView
//
//  Created by Shakhzod Ikromov on 3/13/17.
//  Copyright © 2017 Shakhzod Ikromov. All rights reserved.
//

#import "ViewController.h"
#import "GRMParallaxImageView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet GRMParallaxImageView *parallaxView;
@property (weak, nonatomic) IBOutlet UILabel *tiltXLabel;
@property (weak, nonatomic) IBOutlet UILabel *tiltYLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[touches allObjects] firstObject];
    if (!touch) { return; }
    
    CGPoint p = [touch locationInView:self.view];
    
    self.parallaxView.tiltX = p.x / CGRectGetWidth(self.view.frame);
    self.parallaxView.tiltY = p.y / CGRectGetHeight(self.view.frame);
    
    self.tiltXLabel.text = [NSString stringWithFormat:@"tiltX: %0.2f", self.parallaxView.tiltX];
    self.tiltYLabel.text = [NSString stringWithFormat:@"tiltY: %0.2f", self.parallaxView.tiltY];
}

@end

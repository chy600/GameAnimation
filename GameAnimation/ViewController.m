//
//  ViewController.m
//  GameAnimation
//
//  Created by Chengshu Yu on 2016-04-21.
//  Copyright © 2016 Chengshu Yu. All rights reserved.
//

#import "ViewController.h"
#import "PSGameSurface.h"
#import "PSSprite.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSTimer *timer;
    PSGameSurface *surface;
    PSSprite *background;
    PSSprite *hills;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    surface = [[PSGameSurface alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:surface];
    
    background = [[PSSprite alloc] initWithImage: [UIImage imageNamed:@"bg"]];
    [surface addSprite: background];
    
    hills = [[PSSprite alloc] initWithImage:[UIImage imageNamed:@"hills"]];
    [hills setPosition:CGPointMake(0, 180)];
    [hills setContinuousScrollingSpeed: 22];
    [hills setLoops:true];
    [surface addSprite:hills];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1/30.0 target:self selector:@selector(nextFrame) userInfo:nil repeats:YES];
}

-(void)nextFrame {
    [surface tick];
    [surface setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

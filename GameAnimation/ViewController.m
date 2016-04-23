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
    PSSprite *grass;
    PSSprite *tree1;
    PSSprite *tree2;
    PSSprite *rhino;
    
    double lastGameTime;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    surface = [[PSGameSurface alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:surface];
    
    background = [[PSSprite alloc] initWithImageView: [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"bg"]]];
    [surface addSprite: background toView: self.view];
    
    hills = [[PSSprite alloc] initWithImageView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hills"]]];
    [hills setPosition:CGPointMake(0, 180)];
    [hills setContinuousScrollingSpeed: 40];
    [hills setLoops:YES];
    [surface addSprite:hills toView:self.view];
    
    tree1 = [[PSSprite alloc] initWithImageView: [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tree1"]]];
    [tree1 setPosition:CGPointMake(0, 100)];
    [tree1 setContinuousScrollingSpeed: 70];
    [tree1 setResetToRightSide:YES];
    [surface addSprite:tree1 toView:self.view];
    
    tree2 = [[PSSprite alloc] initWithImageView: [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tree2"]]];
    [tree2 setPosition:CGPointMake(0, 150)];
    [tree2 setContinuousScrollingSpeed: 90];
    [tree2 setResetToRightSide:YES];
    [surface addSprite:tree2 toView:self.view];
    
    grass = [[PSSprite alloc] initWithImageView: [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"grass"]]];
    [grass setPosition:CGPointMake(0, 240)];
    [grass setContinuousScrollingSpeed: 190];
    [grass setLoops:YES];
    [surface addSprite:grass toView:self.view];
    
    UIImageView *rhinoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 206, 95, 70)];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (int i=1; i<=15; i+=1) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"rhinorun_%02d", i]];
        [arr addObject:img];
    }
    rhinoImageView.animationImages = arr;
    rhinoImageView.animationDuration = 1.0/2.5;
    
    rhino = [[PSSprite alloc] initWithImageView:rhinoImageView];
    [rhino setPosition:CGPointMake(60, 206)];
    [surface addSprite:rhino toView:self.view];
    
    [rhinoImageView startAnimating];
    
    lastGameTime = CACurrentMediaTime();
    timer = [NSTimer scheduledTimerWithTimeInterval:1/30.0 target:self selector:@selector(nextFrame) userInfo:nil repeats:YES];
}

-(void)nextFrame {
    double currentTime = CACurrentMediaTime();
    
    double timeDiff = currentTime - lastGameTime;
    lastGameTime = currentTime;
    
    [surface tick: timeDiff];
    [surface setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

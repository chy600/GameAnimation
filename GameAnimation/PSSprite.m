//
//  PSSprite.m
//  GameAnimation
//
//  Created by Chengshu Yu on 2016-04-21.
//  Copyright © 2016 Chengshu Yu. All rights reserved.
//

#import "PSSprite.h"

@implementation PSSprite
{
    CGPoint position;
    float xSpeed;
    BOOL loops;
    BOOL resetToRightSide;
}

@synthesize imageView, secondaryImageView;

-(id)initWithImageView:(UIImageView *)iv {
    self = [super init];
    if (self) {
        imageView = iv;
        position = CGPointMake(0,0);
        xSpeed = 0;
        loops = false;
        resetToRightSide = false;
    }
    return self;
}

-(void)setPosition: (CGPoint)pt {
    position = pt;
    UIImage *img = imageView.image;
    
    if (!img) {
        img = [imageView.animationImages objectAtIndex:0];
    }
    imageView.frame = CGRectMake(pt.x, pt.y, img.size.width, img.size.height);
}

-(void)render {
//    [self.imageView drawAtPoint: position];
//    
//    //If looping, draw the second image right after the first one
//    if (loops) {
//        [image drawAtPoint:CGPointMake(position.x+image.size.width, position.y)];
//    }
}

-(void)update: (double)timeDiff {
    if (xSpeed != 0) {
        [self setPosition:CGPointMake(position.x - xSpeed*timeDiff, position.y)];
        
        if (position.x < imageView.image.size.width * -1) {
            if (!resetToRightSide)
                [self setPosition:CGPointMake(position.x + imageView.image.size.width, position.y)];
            else
                [self setPosition:CGPointMake(560, position.y)];
        }
        
        if (secondaryImageView) {
            secondaryImageView.frame = CGRectMake(imageView.frame.origin.x + imageView.image.size.width, imageView.frame.origin.y, imageView.frame.size.width, imageView.frame.size.height);
        }
    }
}

-(void)setContinuousScrollingSpeed: (float)speed {
    xSpeed = speed;
}

-(void)setLoops:(BOOL)doesLoop {
    loops = doesLoop;
    
    secondaryImageView = [[UIImageView alloc] initWithImage: imageView.image];
}

-(void)setResetToRightSide: (BOOL)b {
    resetToRightSide = b;
}

@end

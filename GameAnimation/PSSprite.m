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
    UIImage *image;
    CGPoint position;
    float xSpeed;
    BOOL loops;
}

-(id)initWithImage: (UIImage *)img {
    self = [super init];
    if (self) {
        image = img;
        position = CGPointMake(0,0);
        xSpeed = 0;
        loops = false;
    }
    return self;
}

-(void)setPosition: (CGPoint)pt {
    position = pt;
}

-(void)render {
    [image drawAtPoint: position];
    
    //If looping, draw the second image right after the first one
    if (loops) {
        [image drawAtPoint:CGPointMake(position.x+image.size.width, position.y)];
    }
}

-(void)update {
    if (xSpeed != 0) {
        position = CGPointMake(position.x - xSpeed, position.y);
        
        if (position.x < image.size.width * -1) {
            position = CGPointMake(position.x + image.size.width, position.y);
        }
    }
}

-(void)setContinuousScrollingSpeed: (float)speed {
    xSpeed = speed;
}

-(void)setLoops:(BOOL)doesLoop {
    loops = doesLoop;
}

@end

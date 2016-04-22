//
//  PSSprite.h
//  GameAnimation
//
//  Created by Chengshu Yu on 2016-04-21.
//  Copyright © 2016 Chengshu Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSSprite : NSObject

-(id)initWithImage: (UIImage *)image;
-(void)setPosition: (CGPoint) pt;
-(void)render;
-(void)update;
-(void)setContinuousScrollingSpeed:(float)speed;
-(void)setLoops:(BOOL)doesLoop;

@end

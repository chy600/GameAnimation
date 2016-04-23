//
//  PSSprite.h
//  GameAnimation
//
//  Created by Chengshu Yu on 2016-04-21.
//  Copyright © 2016 Chengshu Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PSSprite : NSObject

@property UIImageView *imageView;
@property UIImageView *secondaryImageView;

-(id)initWithImageView: (UIImageView *)iv;
-(void)setPosition: (CGPoint) pt;
-(void)render;
-(void)update:(double)timeDiff;
-(void)setContinuousScrollingSpeed:(float)speed;
-(void)setLoops:(BOOL)doesLoop;
-(void)setResetToRightSide: (BOOL)b;

@end

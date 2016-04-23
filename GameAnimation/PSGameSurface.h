//
//  PSGameSurface.h
//  GameAnimation
//
//  Created by Chengshu Yu on 2016-04-21.
//  Copyright © 2016 Chengshu Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSSprite.h"

@interface PSGameSurface : UIView

-(void)addSprite:(PSSprite *)sprite toView:(UIView *)v;
-(void)tick: (double)timeDiff;

@end

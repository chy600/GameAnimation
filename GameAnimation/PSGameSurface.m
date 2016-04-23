//
//  PSGameSurface.m
//  GameAnimation
//
//  Created by Chengshu Yu on 2016-04-21.
//  Copyright © 2016 Chengshu Yu. All rights reserved.
//

#import "PSGameSurface.h"

@implementation PSGameSurface {
    NSMutableArray *sprites;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        sprites = [[NSMutableArray alloc] init];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    for (PSSprite *s in sprites) {
        [s render];
    }
}

-(void)tick: (double)timeDiff {
    for (PSSprite *s in sprites){
        [s update:timeDiff];
    }
}

- (void)addSprite: (PSSprite *)sprite toView: (UIView *)v{
    [sprites addObject:sprite];
    [v addSubview: sprite.imageView];
    if (sprite.secondaryImageView)
        [v addSubview:sprite.secondaryImageView];
}


@end

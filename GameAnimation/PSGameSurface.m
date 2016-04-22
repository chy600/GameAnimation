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

-(void)tick {
    for (PSSprite *s in sprites){
        [s update];
    }
}

- (void)addSprite: (PSSprite *)sprite {
    [sprites addObject:sprite];
}


@end

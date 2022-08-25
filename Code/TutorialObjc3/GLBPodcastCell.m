//
//  GLBPodcastCellTableViewCell.m
//  TutorialObjc3
//
//  Created by Adolfo on 24/8/22.
//

#import "GLBPodcastCell.h"

@interface GLBPodcastCell ()

- (void) handleImageLongTap: (id) object;

@end

@implementation GLBPodcastCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget: self
                                                                                                   action: @selector(handleImageLongTap:)];
    longPressGesture.minimumPressDuration = 1.0;
    
    [self addGestureRecognizer: longPressGesture];
}

- (void) prepareForReuse {
    [super prepareForReuse];
    
    self.imageCover.image = nil;
}

- (void) fetchImage {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL: self.podcast.largeImageURL];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageCover.image = [UIImage imageWithData: data];
        });
    });
}

- (void) handleImageLongTap: (id) object {
    if([self.delegate respondsToSelector:@selector(selectedPodcast:)]) {
        [self.delegate selectedPodcast: self.podcast];
    }
}
@end

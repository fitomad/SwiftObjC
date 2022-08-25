//
//  GLBPodcastCellTableViewCell.h
//  TutorialObjc3
//
//  Created by Adolfo on 24/8/22.
//

#import <UIKit/UIKit.h>
#import "GLBPodcastDelegate.h"

@import AppleFeed;

@interface GLBPodcastCell : UICollectionViewCell
/// Podcast object with the related informatiom
@property (nonatomic) Podcast *podcast;
/// Delegate
@property (nonatomic, weak) id<GLBPodcastDelegate> delegate;

// Podcast cover image
@property (nonatomic, weak) IBOutlet UIImageView *imageCover;


/**
    Fetch the cover image
*/
- (void) fetchImage;

@end

//
//  ViewController.h
//  TutorialObjc3
//
//  Created by Adolfo on 24/8/22.
//

#import <UIKit/UIKit.h>
#import "GLBPodcastCell.h"

@import AppleFeed;

@interface GLBPodcastsController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, GLBPodcastDelegate>
// The collection view where podcasts will be showed
@property (nonatomic, weak) IBOutlet UICollectionView *collectionPodcasts;

@end


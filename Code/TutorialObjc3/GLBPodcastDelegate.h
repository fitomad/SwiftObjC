//
//  PodcastDelegate.h
//  TutorialObjc3
//
//  Created by Adolfo on 24/8/22.
//

#import <Foundation/Foundation.h>
@import AppleFeed;

@protocol GLBPodcastDelegate <NSObject>

- (void) selectedPodcast: (Podcast *) podcast;
@end

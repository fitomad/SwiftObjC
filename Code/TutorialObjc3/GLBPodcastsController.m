//
//  ViewController.m
//  TutorialObjc3
//
//  Created by Adolfo on 24/8/22.
//

#import "GLBPodcastsController.h"
#import "GLBPodcastCell.h"
@import AppleFeed;

@interface GLBPodcastsController ()
/// Podcasts fetched from the Apple RSS feed
@property (nonatomic, copy) NSArray<Podcast *> *podcasts;

/// Set the delegates and navigation bar elements
- (void) prepareUI;
/// Fetch the podcast top list
- (void) loadPoscasts;
@end

@implementation GLBPodcastsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self prepareUI];
    [self loadPoscasts];
}

#pragma mark - Private methods -

- (void) prepareUI {
    [self setTitle: @"Podcasts"];
    
    self.collectionPodcasts.delegate = self;
    self.collectionPodcasts.dataSource = self;
}

- (void) loadPoscasts {
    PodcastFeed *feed = [PodcastFeed new];
    
    [feed requestTopPodcastsWithHandler:^(NSArray<Podcast *> * _Nullable podcasts, NSError * _Nullable error) {
        self.podcasts = podcasts;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionPodcasts reloadData];
        });
    }];
}

#pragma mark - UICollectionViewDelegate protocol implementation -

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *selectedPodcast = self.podcasts[indexPath.item].name;
    NSLog(@"Selected %@", selectedPodcast);
}

- (void) collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    GLBPodcastCell *podcastCell = (GLBPodcastCell *) cell;
    [podcastCell fetchImage];
}

#pragma mark - UICollectionViewDataSource protocol implementation -

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.podcasts.count;
}

- (__kindof UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GLBPodcastCell *podcastCell = [collectionView dequeueReusableCellWithReuseIdentifier: @"PodcastCell" forIndexPath: indexPath];
    podcastCell.delegate = self;
    podcastCell.podcast = self.podcasts[indexPath.item];
    
    return podcastCell;
}

#pragma mark - GLBPodcastDelegate protocol implementation -

- (void) selectedPodcast:(Podcast *) podcast {
    NSLog(@"Delegate tapped %@", podcast.name);
}
@end

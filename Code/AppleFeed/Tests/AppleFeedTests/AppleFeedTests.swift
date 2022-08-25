import XCTest
@testable import AppleFeed

final class AppleFeedTests: XCTestCase {
    func testTopPodcasts() {
        let expectation = self.expectation(description: "Apple Top Podcasts")
        
        let feed = PodcastFeed()
        
        feed.requestTopPodcasts() { podcasts, error in
            if let podcasts = podcasts {
                for podcast in podcasts {
                    print(podcast.name)
                }
            }
            
            expectation.fulfill()
        }
        
        wait(for: [ expectation ], timeout: 5.0)
    }
}

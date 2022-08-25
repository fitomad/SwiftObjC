//
//  PodcastFeed.swift
//
//
//  Created by Adolfo on 25/8/22.
//

import Foundation

public typealias FeedResult = (_ podcasts: [Podcast]?, _ error: Error?) -> Void

@objc public final class PodcastFeed: NSObject {
    struct Settings {
        let feedURL = URL(string: "https://rss.applemarketingtools.com/api/v2/mx/podcasts/top/100/podcasts.json")!
        let decoder = JSONDecoder()
    }
    
    private let settings: Settings

    override public init() {
        self.settings = Settings()
    }
    
    @objc public func requestTopPodcasts(handler: @escaping FeedResult) {
        let task = URLSession.shared.dataTask(with: settings.feedURL, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard let data = data else {
                handler(nil, error)
                
                return
            }
            
            if let feed = try? self.settings.decoder.decode(Feed.self, from: data) {
                handler(feed.result.podcasts, nil)
            } else {
                handler(nil, nil)
            }
        })
        
        task.resume()
    }
    
    @objc public func sayHi(to name: String) {
        print("Hola \(name)")
    }
    
    
}

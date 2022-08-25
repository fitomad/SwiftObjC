//
//  Feed.swift
//  
//
//  Created by Adolfo on 25/8/22.
//

import Foundation

@objc @objcMembers public final class Feed:  NSObject, Decodable {
    public struct PodcastFeed: Decodable {
        public private(set) var title: String
        public private(set) var countryCode: String
        public private(set) var podcasts: [Podcast]
        
        private enum CodingKeys: String, CodingKey {
            case title
            case countryCode = "country"
            case podcasts = "results"
        }
    }
    
    public private(set) var result: Feed.PodcastFeed
    
    private enum CodingKeys: String, CodingKey {
        case result = "feed"
    }
}

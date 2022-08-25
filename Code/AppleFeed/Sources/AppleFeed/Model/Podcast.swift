//
//  Podcast.swift
//  
//
//  Created by Adolfo on 25/8/22.
//

import Foundation

@objc public final class Podcast: NSObject, Decodable {
    @objc public private(set) var artist: String
    @objc public private(set) var podcastId: String
    @objc public private(set) var name: String
    @objc public private(set) var imageURL: URL
    @objc public private(set) var podcastURL: URL
    
    @objc public var largeImageURL: URL {
        let largeImageString = self.imageURL.absoluteString.replacingOccurrences(of: "100x100bb", with: "512x512bb")
        return URL(string: largeImageString)!
    }
    
    private enum CodingKeys: String, CodingKey {
        case artist = "artistName"
        case podcastId = "id"
        case name
        case imageURL = "artworkUrl100"
        case podcastURL = "url"
    }
}

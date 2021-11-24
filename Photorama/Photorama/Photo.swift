//
//  Photo.swift
//  Photorama
//
//  Created by Daniel Belokursky on 18.11.21.
//

import UIKit

class Photo: Codable, Equatable {
    
    let title: String
    let remoteURL: URL?
    let photoID: String
    let dateTaken: Date

    enum CodingKeys: String, CodingKey {
        case title
        case remoteURL = "url_z"
        case photoID = "id"
        case dateTaken = "datetaken"
    }
    
    init(title: String, remoteURL: URL, photoID: String, dateTaken: Date) {
        self.title = title
        self.remoteURL = remoteURL
        self.photoID = photoID
        self.dateTaken = dateTaken
    }
    
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.photoID == rhs.photoID
    }
}

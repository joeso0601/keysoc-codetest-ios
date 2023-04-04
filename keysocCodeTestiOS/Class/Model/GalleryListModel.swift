//
//  GalleryListModel.swift
//  keysocCodeTestiOS
//
//  Created by So Tsz Kiu on 4/4/2023.
//

import Foundation
public struct GalleryListModel: Codable {

    public let resultCount: Int?
    public let results: [GalleryModel]?


    enum GalleryModelKeys: String, CodingKey {
        
        case resultCount = "resultCount"
        case results = "results"


    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        resultCount = try values.decodeIfPresent(Int.self, forKey: .resultCount)
        results = try values.decodeIfPresent([GalleryModel].self, forKey: .results)

        
    }
}

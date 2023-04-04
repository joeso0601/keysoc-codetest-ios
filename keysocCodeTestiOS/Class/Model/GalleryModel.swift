//
//  GalleryModel.swift
//  keysocCodeTestiOS
//
//  Created by So Tsz Kiu on 4/4/2023.
//

import Foundation

public struct GalleryModel: Codable {

    public let imgLink: String?
    public let wrapperType: String?
    public let collectionType: String?
    public let artistId: Int?
    public let collectionId: Int?
    public let amgArtistId: Int?
    public let artistName: String?
    public let collectionName: String?
    public let collectionCensoredName: String?
    public let artistViewUrl: String?
    public let collectionViewUrl: String?
    public let artworkUrl60: String?
    public let artworkUrl100: String?
    public let collectionPrice: Double?
    public let collectionExplicitness: String?
    public let trackCount: Int?
    public let copyright: String?
    public let country: String?
    public let currency: String?
    public let releaseDate: String?
    public let primaryGenreName: String?
    public var bookMark = false
    

    enum GalleryModelKeys: String, CodingKey {
        
        case imgLink = "imgLink"
        case wrapperType = "wrapperType"
        case collectionType = "collectionType"
        case artistId = "artistId"
        case collectionId = "collectionId"
        case amgArtistId = "amgArtistId"
        case artistName = "artistName"
        case collectionName = "collectionName"
        case collectionCensoredName = "collectionCensoredName"
        case artistViewUrl = "artistViewUrl"
        case collectionViewUrl = "collectionViewUrl"
        case artworkUrl60 = "artworkUrl60"
        case artworkUrl100 = "artworkUrl100"
        case collectionPrice = "collectionPrice"
        case collectionExplicitness = "collectionExplicitness"
        case trackCount = "trackCount"
        case copyright = "copyright"
        case country = "country"
        case currency = "currency"
        case releaseDate = "releaseDate"
        case primaryGenreName = "primaryGenreName"

    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        imgLink = try values.decodeIfPresent(String.self, forKey: .imgLink)
        wrapperType = try values.decodeIfPresent(String.self, forKey: .wrapperType)
        collectionType = try values.decodeIfPresent(String.self, forKey: .collectionType)
        artistId = try values.decodeIfPresent(Int.self, forKey: .artistId)
        collectionId = try values.decodeIfPresent(Int.self, forKey: .collectionId)
        amgArtistId = try values.decodeIfPresent(Int.self, forKey: .amgArtistId)
        artistName = try values.decodeIfPresent(String.self, forKey: .artistName)
        collectionName = try values.decodeIfPresent(String.self, forKey: .collectionName)
        collectionCensoredName = try values.decodeIfPresent(String.self, forKey: .collectionCensoredName)
        artistViewUrl = try values.decodeIfPresent(String.self, forKey: .artistViewUrl)
        collectionViewUrl = try values.decodeIfPresent(String.self, forKey: .collectionViewUrl)
        artworkUrl60 = try values.decodeIfPresent(String.self, forKey: .artworkUrl60)
        artworkUrl100 = try values.decodeIfPresent(String.self, forKey: .artworkUrl100)
        collectionPrice = try values.decodeIfPresent(Double.self, forKey: .collectionPrice)
        collectionExplicitness = try values.decodeIfPresent(String.self, forKey: .collectionExplicitness)
        trackCount = try values.decodeIfPresent(Int.self, forKey: .trackCount)
        copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        currency = try values.decodeIfPresent(String.self, forKey: .currency)
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        primaryGenreName = try values.decodeIfPresent(String.self, forKey: .primaryGenreName)
        
    }
}


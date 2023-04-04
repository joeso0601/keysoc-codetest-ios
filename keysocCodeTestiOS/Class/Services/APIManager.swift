//
//  APIManager.swift
//  keysocCodeTestiOS
//
//  Created by So Tsz Kiu on 4/4/2023.
//

import Foundation

protocol APIServiceProtocol {
    
    func getGallery( complete: @escaping ( _ success: Bool, _ gallery: [GalleryModel], _ error: Error? )->() )
    
}
class UrlComponents {
    let path: String
    let BaseURL = "https://itunes.apple.com/"
    
    
    var url: URL {

        let composedUrl = NSURL(string: BaseURL + path )! as URL
        
        return composedUrl
    }
    
    init(path: String) {
        self.path = path
    }
}

private let sessionManager: URLSession = {
    let urlSessionConfiguration: URLSessionConfiguration = URLSessionConfiguration.default
    return URLSession(configuration: urlSessionConfiguration, delegate: nil, delegateQueue: nil)
}(
)

class ITunesAPIService: APIServiceProtocol {
    func getGallery(complete: @escaping (Bool, [GalleryModel], Error?) -> ()) {
        let urlComponents = UrlComponents(path: "search?term=jack+johnson&entity=album")
        let request = URLRequest(url: urlComponents.url)
        
        sessionManager.dataTask(with: request) { (data, response, error) in

            guard error == nil else { complete( false,[], error )
                return
            
            }

            let response = try? JSONDecoder().decode(GalleryListModel.self, from: data!)
                
            complete( true, (response?.results)!, nil )
            
            }.resume()
    }
    
}


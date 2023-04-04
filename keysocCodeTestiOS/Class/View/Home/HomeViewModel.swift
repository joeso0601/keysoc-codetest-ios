//
//  HomeViewModel.swift
//  keysocCodeTestIOS
//
//  Created by So Tsz Kiu on 3/4/2023.
//

import Foundation
import RxSwift
import RxCocoa

final class HomeViewModel:BaseViewModel {
    
    let apiService: APIServiceProtocol
    private let _gallery = BehaviorRelay<[GalleryModel]>(value: [])
    var gallery: Driver<[GalleryModel]> {
        return _gallery.asDriver()
    }
    
    
    init( apiService: APIServiceProtocol = ITunesAPIService()) {
        self.apiService = apiService
    }
    
    
    struct Input {

    }
    
    struct Output {

        let gallery: Driver<[GalleryModel]>
        
    }
    
    func transform(input: Input) -> Output{
    
        apiService.getGallery { success, gallery, error in
            self._gallery.accept(gallery)
        
        }
        
        
        let output = Output(gallery: gallery)
        return output
    }
    
}





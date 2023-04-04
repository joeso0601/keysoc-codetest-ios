//
//  BaseViewModel.swift
//  keysocCodeTestiOS
//
//  Created by So Tsz Kiu on 4/4/2023.
//

import Foundation

protocol BaseViewModel {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}


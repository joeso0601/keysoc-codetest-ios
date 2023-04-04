//
//  HomeViewController.swift
//  keysocCodeTestIOS
//
//  Created by So Tsz Kiu on 3/4/2023.
//

import UIKit
import RxSwift

final class HomeViewController: UIViewController{
    
    @IBOutlet weak var galleryTableVIew: UITableView!
    
    var viewModel: HomeViewModel = HomeViewModel()
    
    override func viewDidLoad() {

//        label.text = "UI init"
        let output = viewModel.transform(input: HomeViewModel.Input())
        output.gallery.drive(onNext:{
            [weak self] gallery in

            print(gallery.count)
            
        })
        
    }

    
}

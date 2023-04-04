//
//  HomeViewController.swift
//  keysocCodeTestIOS
//
//  Created by So Tsz Kiu on 3/4/2023.
//

import UIKit
import RxSwift
import RxCocoa
import SDWebImage

final class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var toggleBookMark: UIButton!
    
    let cellReuseIdentifier = "HomeGalleryTableViewCell"

    @IBOutlet weak var galleryTableView: UITableView!
    
    var viewModel: HomeViewModel = HomeViewModel()
    
    var gallery = [GalleryModel]()
    
    var isShowBookMark = false
    
    func initTableView(){
        let textFieldCell = UINib(nibName: cellReuseIdentifier,
                                      bundle: nil)
        self.galleryTableView.register(textFieldCell,
                                    forCellReuseIdentifier: cellReuseIdentifier)
        galleryTableView.delegate = self
        galleryTableView.dataSource = self

    }
    
    override func viewDidLoad() {

//        label.text = "UI init"
        initTableView()
        let output = viewModel.transform(input: HomeViewModel.Input())
        output.gallery.drive(onNext:{
            [weak self] gallery in

            if(gallery != nil){
                self?.gallery.removeAll()
                self?.gallery.append(contentsOf: gallery)
                self?.galleryTableView.reloadData()
            }
            
        })

        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var result = 0
        if(isShowBookMark){
            result = gallery.filter{ $0.bookMark }.count
        }else{
            result = gallery.count
        }
        return gallery.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let  item = gallery[indexPath.row]
 
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? HomeGalleryTableViewCell {
            cell.lbDesc.text = item.collectionName

            cell.imgGallery.sd_setImage(with: URL(string: item.artworkUrl100 ?? ""))
            
            if(item.bookMark){
                cell.backgroundColor = UIColor.yellow
            }else{
                cell.backgroundColor = UIColor.white
            }
               return cell
           }
           
           return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(isShowBookMark && !gallery[indexPath.row].bookMark){
            return 0
        }else{
            return 100
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        gallery[indexPath.row].bookMark.toggle()
        
        tableView.reloadData()
    }

    @IBAction func toggleBookMarkOnClickListener(_ sender: Any) {
        isShowBookMark = !isShowBookMark
        if(isShowBookMark){
            self.toggleBookMark.setTitle("SHOW ALL", for: .normal)
        }else{

            self.toggleBookMark.setTitle("SHOW BOOKMARK", for: .normal)
        }
        self.galleryTableView.reloadData()
    }
    
}

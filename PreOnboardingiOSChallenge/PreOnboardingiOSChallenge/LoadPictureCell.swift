//
//  LoadPictureCell.swift
//  PreOnboardingiOSChallenge
//
//  Created by Deokhun KIM on 2023/02/28.
//

import UIKit

//class LoadPictureCell: UICollectionViewCell {
//
//    @IBOutlet weak var urlImage: UIImageView!
//    @IBOutlet weak var loadButton: UIButton!
//
//
//    func configure(_ link: PictureLink) {
//        let url = URL(string: link.url)
////        urlImage.load(url: url!)
//        loadImage(url!)
//    }
//
//    func loadImage(_ url: URL) {
//        self.urlImage.image = urlImage.load(url: url)
//    }
//
//}
//
//extension UIImageView {
//    func load(url: URL) {
//        DispatchQueue.global().async { [weak self] in
//            if let data = try? Data(contentsOf: url) {
//                if let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        self?.image = image
//                    }
//                }
//            }
//        }
//    }
//}

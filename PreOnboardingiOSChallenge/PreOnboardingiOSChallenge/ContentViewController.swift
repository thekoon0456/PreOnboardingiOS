//
//  ContentViewController.swift
//  PreOnboardingiOSChallenge
//
//  Created by Deokhun KIM on 2023/03/01.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    
    var firstUrl = "https://i.postimg.cc/ZYgtXdRW/1.jpg"
    var secondUrl = "https://i.postimg.cc/pdTMgYDn/2.jpg"
    var thirdUrl = "https://i.postimg.cc/2yXZ7xFF/3.jpg"
    var fourthUrl = "https://i.postimg.cc/ZRbvkQwx/4.jpg"
    var fifthUrl = "https://i.postimg.cc/m2vcZkdD/5.jpg"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func button1(_ sender: Any) {
        image1.image = UIImage(systemName: "photo")
        let url = URL(string: firstUrl)
        image1.load(url: url!)
    }
    
    @IBAction func button2(_ sender: Any) {
        image2.image = UIImage(systemName: "photo")
        let url = URL(string: secondUrl)
        image2.load(url: url!)
    }
    
    
    @IBAction func button3(_ sender: Any) {
        image3.image = UIImage(systemName: "photo")
        let url = URL(string: thirdUrl)
        image3.load(url: url!)
    }
    
    
    @IBAction func button4(_ sender: Any) {
        image4.image = UIImage(systemName: "photo")
        let url = URL(string: fourthUrl)
        image4.load(url: url!)
    }
    
    
    @IBAction func button5(_ sender: Any) {
        image5.image = UIImage(systemName: "photo")
        let url = URL(string: fifthUrl)
        image5.load(url: url!)
    }
    
    @IBAction func loadAllImages(_ sender: Any) {
        image1.image = UIImage(systemName: "photo")
        image2.image = UIImage(systemName: "photo")
        image3.image = UIImage(systemName: "photo")
        image4.image = UIImage(systemName: "photo")
        image5.image = UIImage(systemName: "photo")
        image1.load(url: URL(string: firstUrl)!)
        image2.load(url: URL(string: secondUrl)!)
        image3.load(url: URL(string: thirdUrl)!)
        image4.load(url: URL(string: fourthUrl)!)
        image5.load(url: URL(string: fifthUrl)!)
    }
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

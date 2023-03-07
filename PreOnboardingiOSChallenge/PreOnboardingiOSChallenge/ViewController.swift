//
//  ViewController.swift
//  PreOnboardingiOSChallenge
//
//  Created by Deokhun KIM on 2023/03/06.
//

import UIKit
//final 상속 안하게 하려고
final class ViewController: UIViewController {
    
    @IBOutlet private var views: [ContentView]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        views.forEach { $0.reset() }

    }
    
    @IBAction private func touchUpLoadAllImageButton(_ sender: UIButton) {
        views.forEach { $0.loadImage() }
    }
    
    
    


}

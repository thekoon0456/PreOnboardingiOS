//
//  ContentViewController.swift
//  PreOnboardingiOSChallenge
//
//  Created by Deokhun KIM on 2023/03/01.
//

import UIKit

fileprivate enum ImageURL {
    private static let imageUrl: [String] = [
        "https://i.postimg.cc/ZYgtXdRW/1.jpg",
        "https://i.postimg.cc/pdTMgYDn/2.jpg",
        "https://i.postimg.cc/2yXZ7xFF/3.jpg",
        "https://i.postimg.cc/ZRbvkQwx/4.jpg",
        "https://i.postimg.cc/m2vcZkdD/5.jpg"
    ]
    
    static subscript(index: Int) -> URL {
        let url = imageUrl[index]
        return URL(string: url)!
    }
}

class ContentView: UIView {
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var progressView: UIProgressView!
    @IBOutlet private var loadButton: UIButton!
    private var observation: NSKeyValueObservation! //키-밸류 observation만들기. 만들면 deinit까지 같이 만들기
    
    deinit { //자동으로 invalidate해주지 않음
        observation.invalidate()
        observation = nil
    }
    
    func reset() {
        imageView.image = .init(systemName: "photo")
        progressView.progress = 0
        loadButton.isEnabled = true
    }
    
    func loadImage() {
        loadButton.sendActions(for: .touchUpInside)
    }
    
    @IBAction private func touchUpLoadButton(_ sender: UIButton) {
        reset()
        
        guard (0...4).contains(sender.tag) else {
            fatalError("버튼 태그를 확인해주세요")
        }
        
        let url = ImageURL[sender.tag]
        let request = URLRequest(url: url) //여기까진 메인스레드. 버튼-화면에서 조작하는것이므로
        
        //dataTask는 resume하면 백그라운드 스레드에서 실햄
        //DispatchQueue.grobal()은 백그라운드 스레드에서 실행
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                //UI업데이트. 메인스레드에서
                DispatchQueue.main.async {
                    self.imageView.image = .init(systemName: "xmark")
                }
                return
            }
            //UI업데이트. 메인스레드에서
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
        //task의 progress를 observing
        observation = task.progress.observe(\.fractionCompleted, //fractionCompleted: 얼만큼 완료했는지
                                             options: [.new],
                                             changeHandler: { progress, change in
            //UI업데이트. 메인스레드에서
            DispatchQueue.main.async {
                self.progressView.progress = Float(progress.fractionCompleted)
            }
        })
        
        task.resume()
    }

}

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

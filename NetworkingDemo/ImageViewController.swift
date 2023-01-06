//
//  ImageViewController.swift
//  NetworkingDemo
//
//  Created by Павел Колесников on 05.01.2023.
//

import UIKit

class ImageViewController: UIViewController {
    
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadImage()
    }
        
    func downloadImage() {
        guard let url = URL(string: "https://applelives.com/wp-content/uploads/2016/03/iPhone-SE-11.jpeg") else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                
                DispatchQueue.main.async {
                    self.imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 800))
                    self.imageView.image = image
                    self.view.addSubview(self.imageView)
                }
            }
        }.resume()
    }
}

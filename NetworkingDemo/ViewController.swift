//
//  ViewController.swift
//  NetworkingDemo
//
//  Created by Павел Колесников on 05.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var imageButton = UIButton()
    var getButton = UIButton()
    var postButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        setupView()
    }
    
// MARC: - Creat buttons
    func setupView() {
        imageButton = UIButton(type: .roundedRect)
        imageButton.backgroundColor = .purple
        imageButton.layer.cornerRadius = 10
        imageButton.frame = CGRect(x: 75, y: 100, width: 250, height: 60)
        imageButton.setTitle("Download Image", for: .normal)
        imageButton.addTarget(self, action: #selector(pressedImageButton), for: .touchUpInside)
        self.view.addSubview(imageButton)
        
        getButton = UIButton(type: .roundedRect)
        getButton.backgroundColor = .purple
        getButton.layer.cornerRadius = 10
        getButton.frame = CGRect(x: 75, y: 200, width: 250, height: 60)
        getButton.setTitle("GET", for: .normal)
        getButton.addTarget(self, action: #selector(pressedGetButton), for: .touchUpInside)
        self.view.addSubview(getButton)
        
        postButton = UIButton(type: .roundedRect)
        postButton.backgroundColor = .purple
        postButton.layer.cornerRadius = 10
        postButton.frame = CGRect(x: 75, y: 300, width: 250, height: 60)
        postButton.setTitle("POST", for: .normal)
        postButton.addTarget(self, action: #selector(pressedPostButton), for: .touchUpInside)
        self.view.addSubview(postButton)
    }
// MARC: - Button methods
    
    @objc func pressedImageButton(_ sender: UIButton) {
        let imageViewController = ImageViewController()
        let navVC = UINavigationController(rootViewController: imageViewController)
        present(navVC, animated: true)
        
        print("Pressed Image Button")
    }
    
    @objc func pressedGetButton(_ sender: UIButton) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            guard let response = response, let data = data else { return }
            print(response)
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                print(json)
            } catch {
                print("error")
            }
        }.resume()
        print("Pressed GET Button")
    }
    
    @objc func pressedPostButton(_ sender: UIButton) {
        
        print("Pressed POST Button")
    }

}


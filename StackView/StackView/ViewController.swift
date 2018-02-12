//
//  ViewController.swift
//  StackView
//
//  Created by Atsuhiro Kou on 2018/02/11.
//  Copyright © 2018年 SoonhoKoh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Prepare for views in stackview
        let view1 = UIView()
        view1.backgroundColor = .lightGray
        let view2 = UIView()
        view2.backgroundColor = .gray
        let photo1 = UIImageView(image: UIImage(named: "Unknown"))
        let photo2 = UIImageView(image: UIImage(named: "Unknown-1"))
        let photo3 = UIImageView(image: UIImage(named: "swift-og"))
        photo1.contentMode = .scaleAspectFit
        photo1.clipsToBounds = true
        photo2.contentMode = .scaleAspectFit
        photo2.clipsToBounds = true
        photo3.contentMode = .scaleAspectFit
        photo3.clipsToBounds = true
        
        // Make stackview
        let rect = CGRect(x: 150, y: 0, width: 150, height: 600)
        let stackView = UIStackView(frame: rect)
        stackView.axis = .vertical  // stack vertically
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        // Add views to stackView
        stackView.addArrangedSubview(view1)
        stackView.addArrangedSubview(view2)
        stackView.addArrangedSubview(photo1)
        stackView.addArrangedSubview(photo2)
        stackView.addArrangedSubview(photo3)
        
        stackView.center = self.view.center
        self.view.addSubview(stackView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


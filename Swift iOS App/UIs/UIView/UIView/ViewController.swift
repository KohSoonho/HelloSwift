//
//  ViewController.swift
//  UIView
//
//  Created by Atsuhiro Kou on 2018/03/23.
//  Copyright © 2018年 SoonhoKoh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // make label
        let labelA = UILabel()
        labelA.text = "label A"
        labelA.backgroundColor = UIColor.orange
        labelA.textColor = UIColor.white
        
        // area of label
        // diaplay labelA at (80, 80) and this size is 110 * 21
        labelA.frame = CGRect(x: 50, y: 50, width: 110, height: 21)
        
        // add label to label
        // self.view is root view
        self.view.addSubview(labelA)
        
        // add subView
        let theView = UIView()
        theView.frame = CGRect(x: 60, y: 150, width: 210, height: 100)
        theView.backgroundColor = UIColor(red:0.9, green:0.9, blue:0.6, alpha:1.0)
        
        // make label
        let labelB = UILabel()
        labelB.text = "label B"
        labelB.backgroundColor = UIColor.orange
        labelB.textColor = UIColor.white
        labelB.frame = CGRect(x: 10, y: 10, width: 110, height: 21)
        
        // add label to theView
        theView.addSubview(labelB)
        // add theView to root view
        self.view.addSubview(theView)
        
        // make UIImageView
        let imageView1 = UIImageView(frame: CGRect(x: 20, y: 300, width: 150, height: 150))
        // keep scale and fit to imageView
        imageView1.contentMode = .scaleAspectFit
        // set image of imageView
        imageView1.image = UIImage(named: "swift-og")
        // add imageView to root view
        self.view.addSubview(imageView1)
        
        let imageView2 = UIImageView(frame: CGRect(x: 200, y: 300, width: 150, height: 150))
        // display image only center
        imageView2.contentMode = .center
        imageView2.clipsToBounds = true
        imageView2.image = UIImage(named: "swift-og")
        self.view.addSubview(imageView2)
        
        // pattern image
        let rstudio = UIImage(named: "Unknown-2")
        // set rstudio to backgroundColor of root view 
        self.view.backgroundColor = UIColor(patternImage: rstudio!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


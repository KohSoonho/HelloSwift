//
//  ViewController.swift
//  View and Image
//
//  Created by Atsuhiro Kou on 2018/02/08.
//  Copyright © 2018年 SoonhoKoh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // make LabelC
        let labelC = UILabel()
        labelC.text = "LabelC"
        
        // area of label
        labelC.frame = CGRect(x: 80, y: 300, width: 110, height: 21)
        // color of String and background
        labelC.backgroundColor = UIColor.orange
        labelC.textColor = UIColor.white
        
        // add to root view
        self.view.addSubview(labelC)
        
        // make view
        let theView = UIView()
        // frame and background color of view
        theView.frame = CGRect(x: 60, y: 100, width: 210, height: 200)
        theView.backgroundColor = UIColor(red:0.9, green:0.9, blue:0.6, alpha:1.0)
        
        // make label
        let labelD = UILabel()
        labelD.text = "LabelD"
        labelD.frame = CGRect(x: 50, y: 60, width: 110, height: 21)
        labelD.backgroundColor = UIColor.orange
        labelD.textColor = UIColor.white
        
        // add labelD to theView
        theView.addSubview(labelD)
        // add theView to rootView
        self.view.addSubview(theView)
        
        // make imageview
        let rect = CGRect(x:0, y:0, width:300, height: 200)
        let imageview = UIImageView(frame: rect)
        
        // display mode of image
        imageview.contentMode = .center
        imageview.clipsToBounds = true
        imageview.image = UIImage(named: "swift-og")
        
        // set image at center
        imageview.center = self.view.center
        // add image to root view
        self.view.addSubview(imageview)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


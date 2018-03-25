//
//  ViewController.swift
//  UIViewStackView
//
//  Created by Atsuhiro Kou on 2018/03/25.
//  Copyright © 2018年 SoonhoKoh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Control coordinate of UI ////////////////////////////////////
    
    // define default coordinate of swift1.center
    let homepoint = CGPoint(x:100, y:100)
    
    // definition of properties
    @IBOutlet weak var swift1: UIImageView!
    @IBOutlet weak var home: UIButton!
    
    @IBAction func goToHome(_ sender: UIButton) {
        // set coordinate of swift1.center to homepoint
        swift1.center = homepoint
    }
    
    @IBOutlet weak var right: UIButton!
    
    @IBAction func goToRight(_ sender: UIButton) {
        // shift right 50 points
        swift1.center.x += 50
    }
    ////////////////////////////////////////////////////////////////
   
    // Control size of UI //////////////////////////////////////////
    
    @IBOutlet weak var swift2: UIImageView!
    
    @IBAction func changeSize(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0 : // set frame.size 100 x 100
                swift2.frame.size = CGSize(width: 100, height: 100)
            case 1 : // set frame.size 135 x 135
                swift2.frame.size = CGSize(width: 135, height: 135)
            default :
                swift2.frame.size = CGSize(width: 100, height: 100)
        }
    }
    
    ////////////////////////////////////////////////////////////////
    
    // Convert coordinate of UI ////////////////////////////////////
    
    @IBOutlet weak var sky: UIView!
    @IBOutlet weak var point: UIButton!
    @IBOutlet weak var arrow: UIImageView!
    
    @IBAction func pointSwift(_ sender: UIButton) {
        // swift3.center return coordinate in SUBVIEW
        // To get coordinate in ROOT VIEW, must use view.convert!
        var point = view.convert(swift3.center, from: sky)
        
        // Modify coordinate of arrow
        point.x += arrow.bounds.width / 2
        point.y -= arrow.bounds.height / 2
        
        // Arrow point center of swift3
        arrow.center = point
    }
    
    @IBOutlet weak var swift3: UIImageView!
    
    ////////////////////////////////////////////////////////////////
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Control coordinate of UI ////////////////////////////////////
        
        home.setTitle("Go to Home!", for: .normal)
        right.setTitle("Go to Right!", for: .normal)
        
        swift1.image = UIImage(named: "swift-og")
        swift1.center = homepoint
        
        ////////////////////////////////////////////////////////////////
        
        // Control size of UI //////////////////////////////////////////
        
        swift2.image = UIImage(named: "swift-og")
        swift2.contentMode = .scaleAspectFill
        swift2.frame.size = CGSize(width: 100, height: 100)
        
        ////////////////////////////////////////////////////////////////
        
        // Convert coordinate of UI ////////////////////////////////////
        
        point.setTitle("Point Swift!", for: .normal)
        swift3.image = UIImage(named: "swift-og")
        arrow.image = UIImage(named: "arrow")
        
        ////////////////////////////////////////////////////////////////
        
        // Stack View //////////////////////////////////////////////////
        // define contents
        let view1 = UIView()
        view1.backgroundColor = .lightGray
        let view2 = UIView()
        view2.backgroundColor = .gray
        let image1 = UIImageView(image: UIImage(named: "swift-og"))
        image1.contentMode = .scaleAspectFill
        image1.clipsToBounds = true
        let image2 = UIImageView(image: UIImage(named: "rstudio"))
        image2.contentMode = .scaleAspectFill
        image2.clipsToBounds = true
        
        // make stackView
        let stackView = UIStackView(frame: CGRect(x: 250, y: 300, width: 100, height: 400))
        stackView.axis = .vertical  // stack vertically
        stackView.distribution = .fillEqually   // fill contents equally
        stackView.spacing = 5  // set space to 5
        
        // add contents to stackView
        stackView.addArrangedSubview(view1)
        stackView.addArrangedSubview(view2)
        stackView.addArrangedSubview(image1)
        stackView.addArrangedSubview(image2)
        
        // add stackView to root view
        self.view.addSubview(stackView)
        
        ////////////////////////////////////////////////////////////////
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


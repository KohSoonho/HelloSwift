//
//  ViewController.swift
//  View2
//
//  Created by Atsuhiro Kou on 2018/02/10.
//  Copyright © 2018年 SoonhoKoh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var swift: UIImageView!
    
    let homePoint = CGPoint(x: 100, y: 150)
    
    @IBAction func goHOme(_ sender: UIButton) {
        swift.center = homePoint
    }
    
    @IBAction func goRight(_ sender: UIButton) {
        swift.center.x += 100
    }
    
    @IBOutlet weak var swift2: UIImageView!
    
    @IBAction func changeFrame(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        switch index {
        case 0 :
            swift2.frame = CGRect(x: 16, y: 300, width: 104, height: 104)
        case 1 :
            swift2.frame = CGRect(x: 16, y: 300, width: 150, height: 150)
        default:
            swift2.frame = CGRect(x: 16, y: 300, width: 150, height: 150)
        }
    }
    
    @IBOutlet weak var arrow: UIImageView!
    @IBOutlet weak var sky: UIView!
    @IBOutlet weak var swift3: UIImageView!
    
    @IBAction func checkSwift(_ sender: UIButton) {
        var point = view.convert(swift3.center, from: sky)
        point.x += arrow.bounds.width/2
        point.y -= arrow.bounds.height/2
        arrow.center = point
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        swift.center = homePoint
        swift2.frame = CGRect(x: 16, y: 300, width: 104, height: 104)
        swift2.contentMode = .scaleAspectFit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


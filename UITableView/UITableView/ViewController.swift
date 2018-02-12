//
//  ViewController.swift
//  UITableView
//
//  Created by Atsuhiro Kou on 2018/02/11.
//  Copyright © 2018年 SoonhoKoh. All rights reserved.
//

import UIKit

// make data of viewtable.
// value of raw make array of tapple.
let sectionTitle = ["C", "Web", "Statistic"]
let section0 = [("C", "typeC"), ("C++", "typeC")]
let section1 = [("Java", "Web"), ("PHP", "Web"), ("Ruby", "Web")]
let section2 = [("R", "Stat"), ("Python", "Stat")]
// Data of each section make array
let tableData = [section0, section1, section2]

// Add protcol to delegate controlling UITableView.
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Make TableView
        let myTableView:UITableView!
        myTableView = UITableView(frame: view.frame, style: .grouped)
        // Set delegate of TableView to UIController
        myTableView.delegate = self
        // Set data source of TableView to UIController
        myTableView.dataSource = self
        // Add myTablevie to root view.
        view.addSubview(myTableView)
    }
    
    // Protocol of UITableDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        // return number of sections (default: 1)
        return sectionTitle.count  // return number of sections from sectionTitle
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return number of lines in each sections. (obligated)
        let sectionData = tableData[section]
        return sectionData.count   // number of each section retun as nuber of lines
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // return title of sections (default: empty)
        return sectionTitle[section] // return elements of sectionTitle return as title of section
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // return cell of each lines. (obligated)
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell") // make cells
        let sectionData = tableData[(indexPath as NSIndexPath).section]
        let cellData = sectionData[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = cellData.0
        cell.detailTextLabel?.text = cellData.1
        return cell
    }
    
    // UITableView delegate method
    // Display tapped line
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title = sectionTitle[indexPath.section]     // Get information of tapped line from indexPath
        let sectionData = tableData[indexPath.section]
        let cellData = sectionData[indexPath.row]
        print("\(title)\(cellData.1)")
        print("\(cellData.0)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


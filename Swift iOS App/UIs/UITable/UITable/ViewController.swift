//
//  ViewController.swift
//  UITable
//
//  Created by Atsuhiro Kou on 2018/03/31.
//  Copyright © 2018年 SoonhoKoh. All rights reserved.
//

import UIKit

// Create Data
// SAS members
let sectionTitle = ["PG", "SG", "SF", "PF", "C"]
let sectionPG = [("Murray", "Dejounte"), ("Parker", "Tony"), ("Mills", "Patty")]
let sectionSG = [("Green", "Danny"), ("Ginobili", "Manu"), ("Forbes", "Bryn")]
let sectionSF = [("Leonard", "Kawhi"), ("Anderson", "Kyle")]
let sectionPF = [("Aldrige", "LaMarcus"), ("Gay", "Rudy")]
let sectionC  = [("Gasol", "Pau"), ("Lauvergne", "Joffrey"), ("Bertans", "Davis")]

let tableData = [sectionPG, sectionSG, sectionSF, sectionPF, sectionC]

// Add TableViewDelegate protocol and TableViewDataSource protocol
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    /* TableViewDataSource Method */
    // Define number of sections (default: 1)
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    // Define number of rows in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // extract section* array from tableData array
        let sectionData = tableData[section]
        // return number of elements from section* array
        return sectionData.count
    }
    
    // Define Title of Section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section] + " players"
    }
    
    // Make UITableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // make cells
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        // extract section* array from tableData array at section-number
        let sectionData = tableData[(indexPath as NSIndexPath).section]
        // extract tupples from section* array at row-number
        let cellData = sectionData[(indexPath as NSIndexPath).row]
        // Set first element of tupple to main text
        cell.textLabel?.text = cellData.0
        // Set second element of tupple to sub text
        cell.detailTextLabel?.text = cellData.1
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /* Make and Put TableView */
        // Make Table
        let myTable = UITableView(frame: view.frame, style: .grouped)
        // Set delegation of TableView to ViewController
        myTable.delegate = self
        // Set delegation of TableDataSource to ViewController
        myTable.dataSource = self
        // Add UITable to rootView
        view.addSubview(myTable)
        
        /* TableView Method */
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let title = sectionTitle[indexPath.section]
            let sectionData = tableData[indexPath.section]
            let cellData = sectionData[indexPath.row]
            
            print("\(title)")
            print("\(cellData.0) \(cellData.1)")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


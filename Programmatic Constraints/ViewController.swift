//
//  ViewController.swift
//  Programmatic Constraints
//
//  Created by Felipe Costa on 6/20/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var randomData = ["Mark", "Joe", "Travis", "Peter", "Phil"]
    
    let tableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createLayout()
    }

    func createLayout(){
        let superview = self.view
        
        superview?.addSubview(tableView)
        
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15.0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10.0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15.0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 15.0).isActive = true
        
        let headerView: UIView = UIView.init(frame: CGRect(x: 1, y: 50, width: 276, height: 30))

        let labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.text = "Title"
        headerView.addSubview(labelView)
        self.tableView.tableHeaderView = headerView

        let myConstraint = NSLayoutConstraint(item: labelView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: headerView, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1.0, constant: 0)
        headerView.addConstraint(myConstraint)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = randomData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // etc
    }

}



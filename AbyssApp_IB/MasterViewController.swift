//
//  MasterViewController.swift
//  AbyssApp_IB
//
//  Created by Ian Campbell Brothers on 3/18/19.
//  Copyright © 2019 Ian Campbell Brothers. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    let dataController = DataController()
    var rebootDataModel: MovieDataModel? {
        didSet {
            tableView.reloadData()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let split = splitViewController {
            _ = split.viewControllers
            print("View did load")
        }
        dataController.getData { (data) in
            
            self.rebootDataModel = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool){
        let nav = self.navigationController?.navigationBar
        
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.yellow
        
        let titleImage = UIImage(named: "IRDb")
        let titleImageView = UIImageView(image: titleImage)
        navigationItem.titleView = titleImageView
    }
    
    

    

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let maingoto = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                maingoto.details = rebootDataModel!.franchise[indexPath.section].entries[indexPath.row]
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return (rebootDataModel?.franchise.count) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (rebootDataModel?.franchise[section].franchiseName) ?? "No data yet"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (rebootDataModel?.franchise[section].entries.count) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = rebootDataModel?.franchise[indexPath.section].entries[indexPath.row].name
        cell.detailTextLabel?.text = rebootDataModel?.franchise[indexPath.section].entries[indexPath.row].yearStart
        
        return cell
    }
}

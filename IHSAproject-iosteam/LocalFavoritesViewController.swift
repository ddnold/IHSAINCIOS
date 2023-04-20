//
//  LocalFavoritesViewController.swift
//  IHSAproject-iosteam
//
//  Created by Nold,Dustin J on 4/20/23.
//

import Foundation
import UIKit

struct Rider {
    let name: String
    let school: String
    let id: Int
}

var userRiders: [Rider] = []

class LocalFavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func removeRiderButtonTapped(_ sender: UIButton) {
        var superview = sender.superview
        while let view = superview, !(view is UITableViewCell) {
            superview = view.superview
        }
        guard let cell = superview as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        userRiders.remove(at: indexPath.row)
        // Remove rider from database or other data storage here
        tableView.deleteRows(at: [indexPath], with: .fade)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userRiders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        //cell.textLabel?.text = filteredData[indexPath.row]
        let riders = userRiders[indexPath.row]
        
        //get element with tag 2001, set rider name
        if let name = cell.contentView.viewWithTag(3000) as? UILabel {
            name.text = riders.name
        }
        //get element with tag 2002, set rider name
        if let school = cell.contentView.viewWithTag(3001) as? UILabel {
            school.text = riders.school
        }
        if let button = cell.contentView.viewWithTag(3002) as? UIButton {
            button.tag = indexPath.row
            button.addTarget(self, action: #selector(removeRiderButtonTapped(_:)), for: .touchUpInside)
        }
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isEditing = false
        
        let rider1 = Rider(name: "John", school: "Northwest", id: 1)
        let rider2 = Rider(name: "Jane", school: "Midwest", id: 2)
        let rider3 = Rider(name: "JohnD", school: "Northwest", id: 1)
        let rider4 = Rider(name: "JaneD", school: "Midwest", id: 2)
        userRiders = [rider1, rider2, rider3, rider4]
        tableView.reloadData()
        
        
        
    }
    
    
    
    
}



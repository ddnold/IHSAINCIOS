//
//  RemoteFavoritesViewController.swift
//  IHSAproject-iosteam
//
//  Created by Nold,Dustin J on 4/20/23.
//

import Foundation
import UIKit


class RemoteFavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,
    UISearchBarDelegate{
    
    private var filteredData: [Rider] = [] // Declare filteredData here

    @IBOutlet var searchBar: UISearchBar!
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
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        let riders = filteredData[indexPath.row]
        
        //get element with tag 2001, set rider name
        if let name = cell.contentView.viewWithTag(3006) as? UILabel {
            name.text = riders.name
        }
        //get element with tag 2002, set rider name
        if let school = cell.contentView.viewWithTag(3007) as? UILabel {
            school.text = riders.school
        }
        if let button = cell.contentView.viewWithTag(3005) as? UIButton {
            button.tag = indexPath.row
            button.addTarget(self, action: #selector(removeRiderButtonTapped(_:)), for: .touchUpInside)
        }
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            // If search text is empty, show all riders
            filteredData = userRiders
        } else {
            // Filter riders whose name or school contains the search text
            filteredData = userRiders.filter { rider in
                let nameRange = rider.name.range(of: searchText, options: .caseInsensitive)
                let schoolRange = rider.school.range(of: searchText, options: .caseInsensitive)
                return nameRange != nil || schoolRange != nil
            }
        }
        tableView.reloadData()
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isEditing = false
        searchBar.delegate = self

        
        let rider1 = Rider(name: "John", school: "Northwest", id: 1)
        let rider2 = Rider(name: "Jane", school: "Midwest", id: 2)
        let rider3 = Rider(name: "JohnD", school: "Northwest", id: 1)
        let rider4 = Rider(name: "JaneD", school: "Midwest", id: 2)
        userRiders = [rider1, rider2, rider3, rider4]
        filteredData = userRiders
        tableView.reloadData()
        
        
        
    }
}




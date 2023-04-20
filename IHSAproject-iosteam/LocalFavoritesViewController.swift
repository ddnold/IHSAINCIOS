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
    let id: Int
}

var userRiders: [Rider] = []

class LocalFavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!

    @IBAction func removeRiderButtonTapped(_ sender: UIButton) {
        let cell = sender.superview?.superview as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell) {
            userRiders.remove(at: indexPath.row)
            // Remove rider from database or other data storage here
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userRiders.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RiderTableViewCell", for: indexPath) as! RiderTableViewCell
        let rider = userRiders[indexPath.row]
        cell.nameLabel?.text = rider.name
        cell.addButton?.tag = indexPath.row
        cell.addButton?.addTarget(self, action: #selector(removeRiderButtonTapped(_:)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Your code for handling row selection goes here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(RiderTableViewCell.self, forCellReuseIdentifier: "RiderTableViewCell")

        
        tableView.dataSource = self
        tableView.delegate = self
        
        let rider1 = Rider(name: "John", id: 1)
        let rider2 = Rider(name: "Jane", id: 2)
        userRiders = [rider1, rider2]
        print(userRiders)
        tableView.reloadData()
        
        

    }




}


class RiderTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
}



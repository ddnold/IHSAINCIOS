//
//  LocalFavoritesViewController.swift
//  IHSAproject-iosteam
//
//  Created by Nold,Dustin J on 4/20/23.
//

import Foundation
import UIKit




class LocalFavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var savedRiders: [FirestoreController.Rider] = []
    
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
        let riderToRemove = savedRiders[indexPath.row]
        savedRiders.remove(at: indexPath.row)
        // Remove rider from database or other data storage here
        tableView.deleteRows(at: [indexPath], with: .fade)
        
        FirestoreController().removeRiderLocally(rider: riderToRemove)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedRiders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        //cell.textLabel?.text = filteredData[indexPath.row]
        let riders = savedRiders[indexPath.row]
        
        //get element with tag 2001, set rider name
        if let name = cell.contentView.viewWithTag(3000) as? UILabel {
            name.text = riders.name
        }
        //get element with tag 2002, set rider name
        if let school = cell.contentView.viewWithTag(3001) as? UILabel {
            school.text = riders.School
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
        
        FirestoreController().getSavedRiders { [weak self] (riders) in
                self?.savedRiders = riders
                self?.tableView.reloadData()
            }
        
        tableView.reloadData()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Fetch saved riders
        FirestoreController().getSavedRiders { [weak self] (riders) in
            self?.savedRiders = riders
            self?.tableView.reloadData()
        }
    }
}



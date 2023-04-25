//
//  RemoteFavoritesViewController.swift
//  IHSAproject-iosteam
//
//  Created by Nold,Dustin J on 4/20/23.
//

import Foundation
/*
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return riders.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
    //cell.textLabel?.text = filteredData[indexPath.row]
    let rider = riders[indexPath.row]
    
    //get element with tag 2001, set rider name
    if let name = cell.contentView.viewWithTag(2001) as? UILabel {
        name.text = rider.name
    }
    //get element with tag 2002, set rider name
    if let school = cell.contentView.viewWithTag(2002) as? UILabel {
        school.text = rider.school
    }
    
    //get element with tag 2003, set favorite status
    if let favoriteButton = cell.contentView.viewWithTag(2003) as? UIButton {
        if rider.favorite {
            favoriteButton.setTitle("Unfavorite", for: .normal)
        } else {
            favoriteButton.setTitle("Favorite", for: .normal)
        }
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped(_:)), for: .touchUpInside)
        favoriteButton.tag = indexPath.row
    }
    
    return cell
}

@objc func favoriteButtonTapped(_ sender: UIButton) {
    let row = sender.tag
    var rider = riders[row]
    rider.favorite = !rider.favorite // toggle favorite status
    riders[row] = rider
    tableViewOutlet.reloadRows(at:
 */

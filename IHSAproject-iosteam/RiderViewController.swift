//
//  RiderViewController.swift
//  IHSAproject-iosteam
//
//  Created by Carter Smith on 2/28/23.
//  RiderView: displays information about an individual rider

import Foundation
import UIKit

class RiderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableViewOutlet: UITableView!
    struct Rider: Codable {
        let id: Int
        let name: String
        let school: String
    }
    
    var riders = [Rider]()
    
    //sample data
    
    let data = ["Lily Zomparelli, Black Hawk College","Josie Spratt, Black Hawk College","Anna Wilhelm, Black Hawk College","Morgan DeBuhr, Iowa State University","Brayden Gruben, Missouri State University"]
    
    //Input rider(#) with name and school
    override func viewDidLoad() {
        super.viewDidLoad()
        let rider1 = Rider(id:0, name: "Lily Zomparelli", school: "Black Hawk College")
        let rider2 = Rider(id:1, name: "Josie Spratt", school: "Black Hawk College")
        let rider3 = Rider(id:2, name: "Anna Wilhelm", school: "Black Hawk College")
        let rider4 = Rider(id:3, name: "Morgan DeBuhr", school: "Iowa State University")
        let rider5 = Rider(id:4, name: "Brayden Gruben", school: "Missouri State University")
        
        riders = [rider1,rider2,rider3,rider4,rider5]
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        

        tableViewOutlet.backgroundColor = .white // or any other color
        tableViewOutlet.bounces = true
        
    }
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
        return cell
    }
    
}

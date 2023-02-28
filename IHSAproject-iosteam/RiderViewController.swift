//
//  RiderViewController.swift
//  IHSAproject-iosteam
//
//  Created by Carter Smith on 2/28/23.
//  RiderView: displays information about an individual rider

import Foundation
import UIKit

class RiderViewController: UIViewController, UITableViewDelegate, UISearchBarDelegate,UITableViewDataSource {
    @IBOutlet weak var classOutlet: UILabel!
    @IBOutlet weak var searchOutlet: UISearchBar!
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    //sample data
    let data = ["Rider, School","Rider, School","Rider, School","Rider, School","Rider, School","Rider, School"]
    var filteredData: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classOutlet.text! = title!
        
        filteredData = data
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        
        searchOutlet.delegate = self
        
        filteredData = data
        tableViewOutlet.backgroundColor = .white // or any other color
        tableViewOutlet.bounces = true
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        self.tableViewOutlet.isHidden = false
        filteredData = []
        if searchText == ""
        {
            filteredData = data
        }
        for word in data{
            if word.uppercased().contains(searchText.uppercased()){
                filteredData.append(word)
            }
        }
        if filteredData.isEmpty{
            filteredData = data
        }
        self.tableViewOutlet.reloadData()
    }
    
}

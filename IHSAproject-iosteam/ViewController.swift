//
//  ViewController.swift
//  IHSAproject-iosteam
//
//  Created by student on 1/24/23.
//

import UIKit

class ViewController: UIViewController {
    
    //ihsalabel
    @IBOutlet weak var ihsaImg: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    let data = ["show1","show2","show3","show4"]
    var filteredData: [String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        filteredData = data
        self.tableView.isHidden = true

        }
    //TODO: Link these buttons to our pages once we have them all together
    @IBAction func generalInfoBtn(_ sender: UIButton) {
    }
    
    @IBAction func annoucementBtn(_ sender: UIButton) {
    }
    
    @IBAction func homeBtn(_ sender: UIButton) {
    }
    
    @IBAction func riderBtn(_ sender: UIButton) {
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    //TODO: interact with displayed elements in table to switch to different view that displays show descriptions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath)
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
    
}

extension ViewController: UISearchBarDelegate{
    
    //TODO: Clear tableview when searchbar clear is pushed
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        tableView.isHidden = true
        filteredData = []
        tableView.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.tableView.isHidden = false
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
        self.tableView.reloadData()
    }
    
    
}
    
    
    




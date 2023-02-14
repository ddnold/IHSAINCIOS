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

        }
    
    //TODO: Link buttons to views once pages are ready.
    //General info view button
    @IBAction func genInfoBtn(_ sender: UIButton) {
    }
    //announcments button view
    @IBAction func announcmentBtn(_ sender: UIButton) {
    }
    //Home button view
    @IBAction func homeBtn(_ sender: UIButton) {
    }
    //Rider information view
    @IBAction func riderinfoBtn(_ sender: UIButton) {
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
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
        if filteredData.isEmpty{
            filteredData = data
        }
        self.tableView.reloadData()
        
    }
}
    
    
    




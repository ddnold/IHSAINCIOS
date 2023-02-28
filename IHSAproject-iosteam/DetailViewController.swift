//
//  DetailViewController.swift
//  IHSAproject-iosteam
//
//  Created by Nold,Dustin J on 2/21/23.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
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
    
    
    @IBOutlet weak var titleOutlet: UILabel!
    
    @IBOutlet weak var dateOutlet: UILabel!
    
    @IBOutlet weak var timeOutlet: UILabel!
    
    @IBOutlet weak var locationOutlet: UILabel!
    
    @IBOutlet weak var searchOutlet: UISearchBar!
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    let data = ["Rider One, a School","Rider Two, another School","Rider Three, some other School","Rider Four, a School","Rider Five,  another School"]
    var filteredData: [String]!
    
    override func viewDidLoad() {
        titleOutlet.text! = title!
        super.viewDidLoad()
         
        filteredData = data
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        
        searchOutlet.delegate = self
        
        filteredData = data
        tableViewOutlet.backgroundColor = .white // or any other color
        tableViewOutlet.bounces = true
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


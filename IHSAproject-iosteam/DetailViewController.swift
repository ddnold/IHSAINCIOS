//
//  DetailViewController.swift
//  IHSAproject-iosteam
//
//  Created by Nold,Dustin J on 2/21/23.
// Modified, Committed, Pushed by Carter Smith, 2/28/2023

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var titleOutlet: UILabel!
    
    @IBOutlet weak var dateOutlet: UILabel!
    
    @IBOutlet weak var timeOutlet: UILabel!
    
    @IBOutlet weak var locationOutlet: UILabel!
    
    @IBOutlet weak var searchOutlet: UISearchBar!
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    //sample data
    let data = ["Rider Class 1, Western ","Rider Class 2","Rider Class 3","Rider Class 4"]
    let date:String = "February 28, 2023"
    let time:String = "10:00 AM"
    let location:String = "1234 1st St. City, State, ZIP"
    
    var filteredData: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleOutlet.text! = title!
        dateOutlet.text! = date
        timeOutlet.text! = time
        locationOutlet.text! = location
         
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
    
     //Rider View Controller setup
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // Get the selected cell and its text label
            let cell = tableView.cellForRow(at: indexPath)
            guard let textLabel = cell?.textLabel else { return }
            
            // Show a new view with the selected text as the title
            guard let riderViewController = storyboard?.instantiateViewController(withIdentifier: "RiderViewController") as? RiderViewController else { return }
        riderViewController.title = textLabel.text
        navigationController?.pushViewController(riderViewController, animated: true)
    }
    

}


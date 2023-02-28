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
    
    let data = ["show1","show2","show3","show4","1","2","3","4","5","6","7","8"]
    var filteredData: [String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        filteredData = data
        tableView.backgroundColor = .blue // or any other color
        tableView.bounces = true
        // Create info button
        let infoButton = UIButton(type: .infoLight)
        infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)

        // Add the info button to the navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: infoButton)
        }
    
    @IBAction func announcementBTN(_ sender: Any) {
    }
    @IBAction func actionBTN(_ sender: Any) {
    }
    
    @IBAction func favoriteBTN(_ sender: Any) {
    }
    @objc func infoButtonTapped() {
        performSegue(withIdentifier: "showInfo", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "showInfo" {
             // Customize the destination view controller before it's presented
             // For example, set properties or pass data to the destination view controller
             let infoViewController = segue.destination as! infoViewController
             infoViewController.title = "infoViewController"
         }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // Get the selected cell and its text label
            let cell = tableView.cellForRow(at: indexPath)
            guard let textLabel = cell?.textLabel else { return }
            
            // Show a new view with the selected text as the title
            guard let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        detailViewController.title = textLabel.text
        navigationController?.pushViewController(detailViewController, animated: true)

        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if !scrollView.isScrollEnabled {
            scrollView.isScrollEnabled = true
        }
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
    

    




//
//  DetailViewController.swift
//  IHSAproject-iosteam
//
//  Created by Nold,Dustin J on 2/21/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleOutlet: UILabel!
    
    @IBOutlet weak var dateOutlet: UILabel!
    
    @IBOutlet weak var timeOutlet: UILabel!
    
    @IBOutlet weak var locationOutlet: UILabel!
    
    @IBOutlet weak var searchOutlet: UISearchBar!
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    let data = ["riderOne, a School","riderTwo, another School","riderThree, some other School","riderFour, a School","riderFive,  another School"]
    var filteredData: [String]!
    
    override func viewDidLoad() {
        titleOutlet.text! = title!
        super.viewDidLoad()
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


//
//  ViewController.swift
//  IHSAproject-iosteam
//
//  Created by student on 1/24/23.
//

import UIKit
import DropDown

class ViewController: UIViewController {
    
    //ihsalabel
    @IBOutlet weak var ihsaImg: UIImageView!
    @IBOutlet weak var myDropDownView: UIView!
    @IBOutlet weak var dropDownButton: UIButton!
    @IBOutlet weak var showLabel: UILabel!
    
    let myDropDown = DropDown()
    var shows = ["show1","show2","show3"]
    
    @IBAction func isTappedDropDownButton(_ sender: Any) {
        myDropDown.show()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myDropDown.anchorView = myDropDownView
        myDropDown.dataSource = shows
        
        myDropDown.bottomOffset = CGPoint(x: 0, y: (myDropDown.anchorView?.plainView.bounds.height)!)
        myDropDown.topOffset = CGPoint(x: 0, y: -(myDropDown.anchorView?.plainView.bounds.height)!)
        myDropDown.direction = .bottom
        
        myDropDown.selectionAction = { (index: Int, item: String) in self.showLabel.text = self.shows[index]
            self.showLabel.textColor = .black
            print("index \(index) and \(item)")
        }
    }
}
    
    
    




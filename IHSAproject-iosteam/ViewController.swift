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
    
    let menu: DropDown = {
        let menu = DropDown()
        menu.dataSource = [
            "show1",
            "show2",
            "show3",
            "show4"
        ]
        return menu
    }()
    menu.layoutMargins(
    override func viewDidLoad() {
        super.viewDidLoad()
        let myView = UIView(frame: navigationController?.navigationBar.frame ?? .zero)
        myView.backgroundColor = .red
        navigationController?.navigationBar.topItem?.titleView = myView
        guard let topView = navigationController?.navigationBar.topItem?.titleView else{
            return
        }
        
        menu.anchorView = topView
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapTopItem))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
        topView.addGestureRecognizer(gesture)
        
        menu.selectionAction = {index, title in
            print("index \(index) and \(title)")
        }
    }
    
    @objc func didTapTopItem() {
        menu.show()
    }
    
    }
    
    
    




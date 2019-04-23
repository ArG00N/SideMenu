//
//  HomeViewController.swift
//  SideMenu
//
//  Created by Giacomo Angerillo on 23.04.19.
//  Copyright © 2019 Giacomo Angerillo. All rights reserved.
//

import UIKit

protocol HomeViewControllerDelegate {
    func toggle(expand: Bool)
}

class HomeViewController: UIViewController {

    var delegate : HomeViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barStyle = .default
        self.view.backgroundColor = UIColor(displayP3Red: 66/255, green: 182/255, blue: 242/255, alpha: 1)
        self.title = "Home"
        
        [UISwipeGestureRecognizer.Direction.left,UISwipeGestureRecognizer.Direction.right].map({d -> UISwipeGestureRecognizer in
            let gesture = UISwipeGestureRecognizer(target: self, action: #selector(self.swipe(_:)))
            gesture.direction = d
            return gesture
        }).forEach { [weak self] in
            self!.view.addGestureRecognizer($0)
        }
        
        self.view.layer.shadowColor = UIColor.darkGray.cgColor
        self.view.layer.shadowOpacity = 0.6
        self.view.layer.shadowOffset = CGSize(width: -3, height: 0)
        self.view.layer.shadowRadius = 5
        self.view.layer.masksToBounds = false
    }
    
    @objc func swipe(_ gesture:UISwipeGestureRecognizer){
        self.delegate?.toggle(expand: gesture.direction == .right)
    }

}

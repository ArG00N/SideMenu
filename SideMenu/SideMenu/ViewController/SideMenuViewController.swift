//
//  SideMenuViewController.swift
//  SideMenu
//
//  Created by Giacomo Angerillo on 23.04.19.
//  Copyright © 2019 Giacomo Angerillo. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController, HomeViewControllerDelegate {
    
    var home : UIViewController!
    var table : UIViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpHomeViewController()
    }
    
    func setUpHomeViewController(){
        let homeViewController = HomeViewController()
        homeViewController.delegate = self
        self.home = homeViewController
        let navigationController = UINavigationController(rootViewController: homeViewController)
        self.add(subController: navigationController)
    }
    
    func setUpMenuTableViewController(){
        table = MenuTableViewController()
        self.add(subController: table!, position: 0)
    }
    func toggle(expand: Bool) {
        
        if table == nil {
            setUpMenuTableViewController()
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.home.view.frame.origin.x = expand ? (self.home.view.frame.width - 80) : 0
        })
    }
}

extension UIViewController {
    
    func add(subController child: UIViewController, position: Int = -1){
        self.addChild(child)
        
        if position > -1 {
            self.view.insertSubview(child.view, at: position)
        }else {
            self.view.addSubview(child.view)
        }
        child.didMove(toParent: self)
    }

}

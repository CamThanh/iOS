//
//  MainTabbarViewController.swift
//  CamThanh
//
//  Created by Thanh Tran on 8/30/18.
//  Copyright © 2018 Thanh Tran. All rights reserved.
//

import UIKit

class MainTabbarViewController: UIViewController {
    
    @IBOutlet var barButtons: [UIButton]!
    
    @IBOutlet weak var containView: UIView!
    
    var favVC: UIViewController!
    var homeVC: UIViewController!
    var profileVC: UIViewController!
    var catVC: UIViewController!
    
    @IBOutlet weak var tabbarView: UIView!
    var selectedIndex: Int = 1
    
    var viewControllers: [UIViewController]!
    
    @IBOutlet weak var favView: UIView!
    @IBOutlet weak var homeView: UIView!
    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var profileView: UIView!
    
    @IBOutlet weak var favIcon: UIImageView!
    
    @IBOutlet weak var homeIcon: UIImageView!
    
    @IBOutlet weak var searchIcon: UIImageView!
    @IBOutlet weak var profileIcon: UIImageView!
    
    @IBOutlet weak var lblFav: UILabel!
    
    @IBOutlet weak var lblHome: UILabel!
    
    @IBOutlet weak var lblCat: UILabel!
    
    @IBOutlet weak var lblProfile: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.setUpVCs()
        
        self.barButtons[self.selectedIndex].isSelected = true
        self.didTapTabItem(self.barButtons[self.selectedIndex])
        
        
        self.tabbarView.layer.shadowOffset = CGSize(width: 2, height: 0)
        self.tabbarView.layer.shadowColor = UIColor.black.cgColor
        self.tabbarView.layer.shadowRadius = 2
        self.tabbarView.layer.shadowOpacity = 0.25
        self.tabbarView.clipsToBounds = true
        self.tabbarView.layer.masksToBounds = false
    }
    
    func setUpVCs() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.favVC = storyboard.instantiateViewController(withIdentifier: "favVC")
        self.homeVC = storyboard.instantiateViewController(withIdentifier: "homeVC")
        self.profileVC = storyboard.instantiateViewController(withIdentifier: "profileVC")
        self.catVC = storyboard.instantiateViewController(withIdentifier: "catVC")
        
//        let favNav = UINavigationController(rootViewController: self.favVC)
//        let homeNav = UINavigationController(rootViewController: self.homeVC)
//        let profileNav = UINavigationController(rootViewController: self.profileVC)
//        let catNav = UINavigationController(rootViewController: self.catVC)
//        self.viewControllers = [favNav,homeNav,catNav,profileNav];
        self.viewControllers = [self.favVC,self.homeVC,self.catVC,self.profileVC];
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(self.moveToCategories), name: NSNotification.Name(rawValue: "moveToCategories"), object: nil)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func moveToCategories() {
        self.didTapTabItem(self.barButtons[3])
        
    }
    @objc func hideTabbar() {
        self.tabbarView.isHidden = true
        
    }
    @objc func showTabbar() {
        self.tabbarView.isHidden = false
        
    }
    
    
    

    @IBAction func didTapTabItem(_ sender: UIButton) {
        
        let previousIndex = self.selectedIndex
        self.selectedIndex = sender.tag
        
        self.barButtons[previousIndex].isSelected = false
        
        let previousVC = self.viewControllers[previousIndex]
        
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        sender.isSelected = true
        
        let selectedVC = self.viewControllers[self.selectedIndex]
        self.addChildViewController(selectedVC)
        
        selectedVC.view.frame = self.containView.bounds
        self.containView.addSubview(selectedVC.view)
        
        selectedVC.didMove(toParentViewController: self)
        
        
        self.customBarUIs(tag: self.selectedIndex)
        
    }
    
    func customBarUIs(tag:Int){
        
        switch tag {
        case 0:
            self.favView.backgroundColor = UIColor.white
            self.homeView.backgroundColor = UIColor.white
            self.profileView.backgroundColor = UIColor.white
            self.searchView.backgroundColor = UIColor.white
            self.favIcon.image = UIImage(named: "icon_fav_white")
            self.homeIcon.image = UIImage(named: "icon_home_pink")
            self.profileIcon.image = UIImage(named: "icon_user_pink")
            self.searchIcon.image = UIImage(named: "icon_search_pink")
            
            self.favIcon.image = self.favIcon.image?.withRenderingMode(.alwaysTemplate)
            self.homeIcon.image = self.homeIcon.image?.withRenderingMode(.alwaysTemplate)
            self.profileIcon.image = self.profileIcon.image?.withRenderingMode(.alwaysTemplate)
            self.searchIcon.image = self.searchIcon.image?.withRenderingMode(.alwaysTemplate)
            
            self.favIcon.tintColor = UIColor(red: 250.0/255, green: 151.0/255, blue: 154.0/255, alpha: 1)
            self.homeIcon.tintColor = UIColor(red: 155.0/255, green: 155.0/255, blue: 155.0/255, alpha: 1)
            self.profileIcon.tintColor = UIColor(red: 155.0/255, green: 155.0/255, blue: 155.0/255, alpha: 1)
            self.searchIcon.tintColor = UIColor(red: 155.0/255, green: 155.0/255, blue: 155.0/255, alpha: 1)
            
            self.lblFav.textColor = UIColor(red: 250.0/255, green: 151.0/255, blue: 154.0/255, alpha: 1)
            self.lblHome.textColor = UIColor(red: 155.0/255, green: 155.0/255, blue: 155.0/255, alpha: 1)
            self.lblCat.textColor = UIColor(red: 155.0/255, green: 155.0/255, blue: 155.0/255, alpha: 1)
            self.lblProfile.textColor = UIColor(red: 155.0/255, green: 155.0/255, blue: 155.0/255, alpha: 1)
            
            
        case 1:
            self.favView.backgroundColor = UIColor.white
            self.homeView.backgroundColor = UIColor.white
            self.profileView.backgroundColor = UIColor.white
            self.searchView.backgroundColor = UIColor.white
            self.favIcon.image = UIImage(named: "icon_fav_white")
            self.homeIcon.image = UIImage(named: "icon_home_pink")
            self.profileIcon.image = UIImage(named: "icon_user_pink")
            self.searchIcon.image = UIImage(named: "icon_search_pink")
            
            self.favIcon.image = self.favIcon.image?.withRenderingMode(.alwaysTemplate)
            self.homeIcon.image = self.homeIcon.image?.withRenderingMode(.alwaysTemplate)
            self.profileIcon.image = self.profileIcon.image?.withRenderingMode(.alwaysTemplate)
            self.searchIcon.image = self.searchIcon.image?.withRenderingMode(.alwaysTemplate)
            
            self.favIcon.tintColor = UIColor(red: 155.0/255, green: 155.0/255, blue: 155.0/255, alpha: 1)
            self.homeIcon.tintColor = UIColor(red: 250.0/255, green: 151.0/255, blue: 154.0/255, alpha: 1)
            self.profileIcon.tintColor = UIColor(red: 155.0/255, green: 155.0/255, blue: 155.0/255, alpha: 1)
            self.searchIcon.tintColor = UIColor(red: 155.0/255, green: 155.0/255, blue: 155.0/255, alpha: 1)
            
            self.lblFav.textColor = UIColor(red: 155.0/255, green: 155.0/255, blue: 155.0/255, alpha: 1)
            self.lblHome.textColor = UIColor(red: 250.0/255, green: 151.0/255, blue: 154.0/255, alpha: 1)
            self.lblCat.textColor = UIColor(red: 155.0/255, green: 155.0/255, blue: 155.0/255, alpha: 1)
            self.lblProfile.textColor = UIColor(red: 155.0/255, green: 155.0/255, blue: 155.0/255, alpha: 1)
        case 2:
            
            self.favView.backgroundColor = UIColor.white
            self.homeView.backgroundColor = UIColor.white
            self.profileView.backgroundColor = UIColor.white
            self.searchView.backgroundColor = UIColor.white
            self.favIcon.image = UIImage(named: "icon_fav_white")
            self.homeIcon.image = UIImage(named: "icon_home_pink")
            self.profileIcon.image = UIImage(named: "icon_user_pink")
            self.searchIcon.image = UIImage(named: "icon_search_pink")
            
            self.favIcon.image = self.favIcon.image?.withRenderingMode(.alwaysTemplate)
            self.homeIcon.image = self.homeIcon.image?.withRenderingMode(.alwaysTemplate)
            self.profileIcon.image = self.profileIcon.image?.withRenderingMode(.alwaysTemplate)
            self.searchIcon.image = self.searchIcon.image?.withRenderingMode(.alwaysTemplate)
            
            self.favIcon.tintColor = UIColor(red: 155.0/255, green: 155.0/255, blue: 155.0/255, alpha: 1)
            self.homeIcon.tintColor = UIColor(red: 155.0/255, green: 155.0/255, blue: 155.0/255, alpha: 1)
            self.profileIcon.tintColor = UIColor(red: 155.0/255, green: 155.0/255, blue: 155.0/255, alpha: 1)
            self.searchIcon.tintColor = UIColor(red: 250.0/255, green: 151.0/255, blue: 154.0/255, alpha: 1)
            
            self.lblFav.textColor = UIColor(red: 155.0/255, green: 155.0/255, blue: 155.0/255, alpha: 1)
            self.lblHome.textColor = UIColor(red: 155.0/255, green: 155.0/255, blue: 155.0/255, alpha: 1)
            self.lblCat.textColor = UIColor(red: 250.0/255, green: 151.0/255, blue: 154.0/255, alpha: 1)
            self.lblProfile.textColor = UIColor(red: 155.0/255, green: 155.0/255, blue: 155.0/255, alpha: 1)
            
        default:
            self.favView.backgroundColor = UIColor.white
            self.homeView.backgroundColor = UIColor.white
            self.profileView.backgroundColor = UIColor.white
            self.searchView.backgroundColor = UIColor.white
            self.favIcon.image = UIImage(named: "icon_fav_white")
            self.homeIcon.image = UIImage(named: "icon_home_pink")
            self.profileIcon.image = UIImage(named: "icon_user_pink")
            self.searchIcon.image = UIImage(named: "icon_search_pink")
            
            self.favIcon.image = self.favIcon.image?.withRenderingMode(.alwaysTemplate)
            self.homeIcon.image = self.homeIcon.image?.withRenderingMode(.alwaysTemplate)
            self.profileIcon.image = self.profileIcon.image?.withRenderingMode(.alwaysTemplate)
            self.searchIcon.image = self.searchIcon.image?.withRenderingMode(.alwaysTemplate)
            
            self.favIcon.tintColor = UIColor(red: 155.0/255, green: 155.0/255, blue: 155.0/255, alpha: 1)
            self.homeIcon.tintColor = UIColor(red: 155.0/255, green: 155.0/255, blue: 155.0/255, alpha: 1)
            self.profileIcon.tintColor = UIColor(red: 250.0/255, green: 151.0/255, blue: 154.0/255, alpha: 1)
            self.searchIcon.tintColor = UIColor(red: 155.0/255, green: 155.0/255, blue: 155.0/255, alpha: 1)
            
            self.lblFav.textColor = UIColor(red: 155.0/255, green: 155.0/255, blue: 155.0/255, alpha: 1)
            self.lblHome.textColor = UIColor(red: 155.0/255, green: 155.0/255, blue: 155.0/255, alpha: 1)
            self.lblCat.textColor = UIColor(red: 155.0/255, green: 155.0/255, blue: 155.0/255, alpha: 1)
            self.lblProfile.textColor = UIColor(red: 250.0/255, green: 151.0/255, blue: 154.0/255, alpha: 1)
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

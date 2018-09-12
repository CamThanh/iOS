//
//  HomePageViewController.swift
//  CamThanh
//
//  Created by Thanh Tran on 9/8/18.
//  Copyright © 2018 Thanh Tran. All rights reserved.
//

import UIKit

protocol HomePageViewControllerDelegate: class
{
    func setupPageController(numberOfPages: Int)
    func turnPageController(to index: Int)
}



class HomePageViewController: UIPageViewController {

    
    var images: [UIImage]?
    weak var homePageViewDelegate: HomePageViewControllerDelegate?
    
    struct Storyboard {
        static let hotBooksImagesViewController = "hotVC"
    }
    
    lazy var controllers: [UIViewController] = {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var controllers = [UIViewController]()
        
        
        
        
        if let images = self.images {
            for image in images {
                let shoeImageVC = storyboard.instantiateViewController(withIdentifier: Storyboard.hotBooksImagesViewController)
                controllers.append(shoeImageVC)
            }
        }
        
        self.homePageViewDelegate?.setupPageController(numberOfPages: controllers.count)
        
        return controllers
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let image1 = UIImage(named: "truyen1")
        let image2 = UIImage(named: "truyen2")
        let image3 = UIImage(named: "truyen3")
        self.images = []
        self.images?.append(image1!)
        self.images?.append(image2!)
        self.images?.append(image3!)
        // Do any additional setup after loading the view.
        automaticallyAdjustsScrollViewInsets = false
        self.dataSource = self
        self.delegate = self as? UIPageViewControllerDelegate
        
        self.turnToPage(index: 0)
        
    }
    
    func turnToPage(index: Int)
    {
        let controller = controllers[index]
        var direction = UIPageViewControllerNavigationDirection.forward
        
        if let currentVC = viewControllers?.first {
            let currentIndex = controllers.index(of: currentVC)!
            if currentIndex > index {
                direction = .reverse
            }
        }
        
        self.configureDisplaying(viewController: controller)
        
        setViewControllers([controller], direction: direction, animated: true, completion: nil)
    }
    
    func configureDisplaying(viewController: UIViewController)
    {
        for (index, vc) in controllers.enumerated() {
            if viewController === vc {
                if let shoeImageVC = viewController as? HotBooksImagesViewController {
                    shoeImageVC.image = self.images?[index]
                    
                    self.homePageViewDelegate?.turnPageController(to: index)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

// MARK: - UIPageViewControllerDataSource

extension HomePageViewController : UIPageViewControllerDataSource
{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        if let index = controllers.index(of: viewController) {
            if index > 0 {
                return controllers[index-1]
            }
        }
        
        return controllers.last
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        if let index = controllers.index(of: viewController) {
            if index < controllers.count - 1 {
                return controllers[index + 1]
            }
        }
        
        return controllers.first
    }
}
extension HomePageViewController : UIPageViewControllerDelegate
{
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController])
    {
        self.configureDisplaying(viewController: pendingViewControllers.first as! HotBooksImagesViewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool)
    {
        if !completed {
            self.configureDisplaying(viewController: previousViewControllers.first as! HotBooksImagesViewController)
        }
    }
}

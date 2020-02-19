//
//  OnBoardingPageViewController.swift
//  Workout Tracker
//
//  Created by Stephanie Bowles on 2/19/20.
//  Copyright © 2020 LambdaLabsPT7. All rights reserved.
//

import UIKit

class OnBoardingPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    
    var pageControl = UIPageControl()

      lazy var orderedViewControllers: [UIViewController] = {
          return [self.newVC(viewController: "OnboardingFirst"),
                  self.newVC(viewController: "OnboardingSecond")]
      }()
      
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
           guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
                      return nil
                  }
                let previousIndex = viewControllerIndex - 1
                
                guard previousIndex >= 0 else {
                    return orderedViewControllers.last
        //            return nil
                }
                
                guard orderedViewControllers.count > previousIndex else {
                    return nil
                }
                
                return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
          guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
                    return nil
                }
                let nextIndex = viewControllerIndex + 1
                
                guard orderedViewControllers.count != nextIndex  else {
                    return orderedViewControllers.first
        //            return nil
                }
                
                guard orderedViewControllers.count > nextIndex else {
                    return nil
                }
                
                return orderedViewControllers[nextIndex]
            
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        self.delegate = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
         DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.configurePageControl()
            print(self.pageControl)
             }
    }
    
    func configurePageControl() {
   
//    pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50))
        pageControl = UIPageControl(frame: CGRect(x: UIScreen.main.bounds.width/2,y: UIScreen.main.bounds.maxY - 100,width: 0,height: 0))
    self.pageControl.numberOfPages = orderedViewControllers.count
    self.pageControl.currentPage = 0
    self.pageControl.tintColor = UIColor.black
    self.pageControl.pageIndicatorTintColor = UIColor.gray
    self.pageControl.currentPageIndicatorTintColor = UIColor.black
    self.view.addSubview(pageControl)
       


    } 
    
    func newVC(viewController: String) -> UIViewController {
        return UIStoryboard(name: "Onboarding", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
          let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.firstIndex(of: pageContentViewController)!
      }
        
        
    

   

}

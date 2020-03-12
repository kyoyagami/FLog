//
//  TabBarWireframe.swift
//  FLog
//
//  Created by Yejun Park on 12/3/20.
//  Copyright © 2020 Yejun Park. All rights reserved.
//
import Foundation
import UIKit

/**
TabBarWireframe is responsible for navigation between AppDelegate and Initial View Controller.
This provides navigation to tabs on TabBarController.
 */
public class TabBarWireframe {
    
    /// Creates initial modules of each tab
    public class func createInitialModule() -> UIViewController {
        
        let tabbarController = UIStoryboard(name: "TabBarController", bundle: Bundle.main).instantiateInitialViewController() as? UITabBarController
        
        var viewControllers = [UIViewController]()
        viewControllers.append(RoutineWireFrame.createRoutineModule())
        viewControllers.append(TimelineWireFrame.createTimelineModule())
        
        tabbarController!.viewControllers = viewControllers
        tabbarController!.tabBar.items![0].title = "FLOG"
        tabbarController!.tabBar.items![0].image = UIImage(systemName: "rectangle.split.3x3")
        tabbarController!.tabBar.items![0].selectedImage = UIImage(systemName: "rectangle.split.3x3")
        
        tabbarController!.tabBar.items![1].title = "TIMELINE"
        tabbarController!.tabBar.items![1].image = UIImage(systemName: "clock")
        tabbarController!.tabBar.items![1].selectedImage = UIImage(systemName: "clock")
        return tabbarController ?? UIViewController()
    }
    
}


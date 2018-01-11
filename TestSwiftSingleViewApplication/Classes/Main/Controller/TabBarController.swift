//
//  TabBarController.swift
//  TestSwiftSingleViewApplication
//
//  Created by lin peng on 2018/1/11.
//  Copyright © 2018年 lin peng. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

}

// MARK: - life cycle
extension TabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildControllers()
        
    }
}
// MARK: - delegate
// MARK: - event response
// MARK: - private methods
extension TabBarController {
    fileprivate func addChildControllers() {
        addAloneChildController(controller: LiveViewController(), title: "直播", image: "tabbar-normal-0", selectedImage: "tabbar-selected-0")
        addAloneChildController(controller: DiscoverViewController(), title: "发现", image: "tabbar-normal-1", selectedImage: "tabbar-selected-1")
        addAloneChildController(controller: PlayViewController(), title: "", image: "tabbar_mid_rotate_small", selectedImage: "tabbar_mid_rotate_small")
        addAloneChildController(controller: eDAViewController(), title: "eDA", image: "tabbar-normal-3", selectedImage: "tabbar-selected-3")
        addAloneChildController(controller: MineViewController(), title: "我的", image: "tabbar-normal-4", selectedImage: "tabbar-selected-4")
    }
    fileprivate func addAloneChildController(controller: UIViewController, title: String, image: String, selectedImage: String) {
        
        controller.tabBarItem.image = UIImage(named: image)
        controller.tabBarItem.selectedImage = UIImage(named:selectedImage)
        controller.title = title
        
        let navController = NavigationController(rootViewController: controller)
        addChildViewController(navController)
    }
}
// MARK: - lazy load


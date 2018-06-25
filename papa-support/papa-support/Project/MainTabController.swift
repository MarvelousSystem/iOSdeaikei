


import UIKit

class MainTabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TabBarColor
        self.tabBar.barTintColor = UIColor.white
        
        var viewControllers: [UIViewController] = []
        
        let first = MatchingListViewController()
        var firstNavigation: UINavigationController?
        firstNavigation = UINavigationController(rootViewController: first)
        firstNavigation?.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.mostRecent, tag: 1)
        viewControllers.append(firstNavigation!)
        
        let second = LikedViewController()
        var secondNavigation: UINavigationController?
        secondNavigation = UINavigationController(rootViewController: second)
        secondNavigation?.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.mostViewed, tag: 2)
        viewControllers.append(secondNavigation!)
        
        let third = MessageListViewController()
        var thirdNavigation: UINavigationController?
        thirdNavigation = UINavigationController(rootViewController: third)
        thirdNavigation?.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.contacts, tag: 3)
        viewControllers.append(thirdNavigation!)
        /*
        let fourth = ScheduleViewController()
        fourth.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.mostViewed, tag: 4)
        viewControllers.append(fourth)
        */
        let fifth = ProfileViewController()
        var fifthNavigation: UINavigationController?
        fifthNavigation = UINavigationController(rootViewController: fifth)
        fifthNavigation?.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.contacts, tag: 5)
        viewControllers.append(fifthNavigation!)
        // Set
        self.setViewControllers(viewControllers, animated: false)
        
        // なぜか0だけだと選択されないので1にしてから0に
        self.selectedIndex = 1
        self.selectedIndex = 0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


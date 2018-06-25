


import UIKit

class MainTabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TabBarColor
        self.tabBar.barTintColor = UIColor.white
        
        var viewControllers: [UIViewController] = []
        
        let first = MatchingListViewController()
        first.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.mostRecent, tag: 1)
        viewControllers.append(first)
        let second = LikedViewController()
        second.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.mostViewed, tag: 2)
        viewControllers.append(second)
        let third = MessageListViewController()
        third.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.contacts, tag: 3)
        viewControllers.append(third)
        /*
        let fourth = ScheduleViewController()
        fourth.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.mostViewed, tag: 4)
        viewControllers.append(fourth)
        */
        let fifth = ProfileViewController()
        fifth.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.contacts, tag: 5)
        viewControllers.append(fifth)
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


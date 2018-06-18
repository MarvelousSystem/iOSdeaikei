//  Created by Miyamoto on 2018/05/21.
//  Copyright © 2018年 MiyamotoSuta. All rights reserved.

import UIKit

// MARK: vars and lifecycles
class LikedViewController: UIViewController {
    // vars
    var collectionView: UICollectionView!
    var pageControllers: [UIViewController]! = []
    var containerView: UIView!
    var childViewController: UIViewController!
    let pageList = ["お相手から", "あなたから"]
    // lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        SetContainerView()
        SetCollectionViewSet()
        self.view.backgroundColor = UIColor.white
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem!.title = "いいね"
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.topItem!.title = " "
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // CollectionView
    func SetCollectionViewSet() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.minimumLineSpacing = 0.0
        flowLayout.itemSize = CGSize(width: self.view.bounds.width / 2 ,  height: CGFloat(DeviceSize.navigationbarHeight / 5 * 4))
        let rec: CGRect = CGRect(x: 0, y: DeviceSize.statusBarHeight + DeviceSize.navigationbarHeight, width: DeviceSize.screenWidth, height: DeviceSize.navigationbarHeight / 5 * 4)
        collectionView = UICollectionView(frame: rec, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        // Layer
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: self.collectionView.bounds.height - 1.0, width: self.collectionView.bounds.width, height: 1.0)
        topBorder.backgroundColor = UIColor.lightGray.cgColor
        self.collectionView.layer.addSublayer(topBorder)
    }
    // ContainerView
    func SetContainerView() {
        // ContainerViewの生成
        containerView = UIView(frame: CGRect(x: 0, y: DeviceSize.statusBarHeight + DeviceSize.navigationbarHeight * (1 + 1 / 5 * 4), width: DeviceSize.screenWidth, height: DeviceSize.screenHeight - DeviceSize.statusBarHeight - DeviceSize.tabBarHeight - DeviceSize.navigationbarHeight * (1 + 1 / 5 * 4)))
        // Containerに格納するViewController
        let likedFromViewController: LikedFromViewController = LikedFromViewController()
        likedFromViewController.view.tag = 1
        likedFromViewController.view.frame = containerView.bounds
        self.pageControllers.append(likedFromViewController)
        let likeToViewController: LikeToViewController = LikeToViewController()
        likeToViewController.view.tag = 2
        likeToViewController.view.frame = containerView.bounds
        self.pageControllers.append(likeToViewController)
        // Containerの設定
        addChildViewController(pageControllers[0])
        containerView.addSubview(pageControllers[0].view)
        pageControllers[0].didMove(toParentViewController: self)
        childViewController = pageControllers[0]
        // Add
        view.addSubview(containerView)
    }
}

// MARK: -UICollectionViewDelegate, UICollectionViewDataSource
extension LikedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(LikedCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(LikedCollectionViewCell.self))
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(LikedCollectionViewCell.self), for: indexPath) as!
        LikedCollectionViewCell
        cell.label.text = pageList[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        
        //選択された所に遷移
        
        
    }
}

//


 /*
// MARK vars and lifecycles
class LikedViewController: UIPageViewController {
 
    let pageList = ["PAGE1", "PAGE1"]
    var pageControllers = [UIViewController]()
    var collectionView: UICollectionView!
    var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MakeViewController()
        setViewControllers(setViewControllers([pageControllers[0]], direction: .forward, animated: false, completion: nil)[pageControllers[0]], direction: .forward, animated: false, completion: nil)
        CollectionViewLayoutSet()
        // PageViewController and CollectionVIew
        self.dataSource = self
        self.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delaysContentTouches = false
        view.addSubview(collectionView)
        ContainerViewLayout()
        view.addSubview(containerView)
        self.view.subviews
            .filter{ $0.isKind(of: UIScrollView.self) }
            .forEach{($0 as! UIScrollView).delegate = self }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //コレクションビューのレイアウト
    func CollectionViewLayoutSet() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.minimumLineSpacing = 0.0
        flowLayout.itemSize = CGSize(width: self.view.bounds.width / 2 ,  height: CGFloat(DeviceSize.navigationbarHeight / 1.3))
        let rec: CGRect = CGRect(x: 0, y: DeviceSize.statusBarHeight + DeviceSize.navigationbarHeight, width: DeviceSize.screenWidth, height: DeviceSize.navigationbarHeight / 1.3)
        collectionView = UICollectionView(frame: rec, collectionViewLayout: flowLayout)
    }
    //コンテナビューの生成
    func ContainerViewLayout() {
        containerView = UIView.init(frame: CGRect.init(x: 0, y: DeviceSize.navigationbarHeight * (1 + 1 / 1.3), width: DeviceSize.screenWidth, height: DeviceSize.screenHeight - DeviceSize.navigationbarHeight * (1 + 1 / 1.3) - DeviceSize.tabBarHeight))
        containerView.backgroundColor = UIColor.blue
    }
    //ビューコントローラーの作成
    func MakeViewController() {
        let likedFromViewController: LikedFromViewController = LikedFromViewController()
        likedFromViewController.view.tag = 1
        self.pageControllers.append(likedFromViewController)
        let likeToViewController: LikeToViewController = LikeToViewController()
        likeToViewController.view.tag = 2
        self.pageControllers.append(likeToViewController)
    }
}

//MARK UIPageViewControllerDataSource and UIPageViewControllersDelegate
extension LikedViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index: Int = pageControllers.index(of: viewController)!
        if (index == 0) {
            return nil
        } else {
            return pageControllers[index - 1]
        }
    }
 
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index: Int = pageControllers.index(of: viewController)!
        if (index == pageControllers.count - 1) {
            return nil
        } else {
            return pageControllers[index + 1]
        }
    }
}

//MARK UICollectionViewDataSource and UICollectionViewDelegate
extension LikedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.register(LikedCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(LikedCollectionViewCell.self))
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(LikedCollectionViewCell.self), for: indexPath) as!
 
 LikedCollectionViewCell
        return cell
    }
    // Cell が選択された場合
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //選択された所に遷移
        self.setViewControllers([pageControllers[indexPath.row]], direction: .forward, animated: false, completion: nil)
    }
}
 
 */

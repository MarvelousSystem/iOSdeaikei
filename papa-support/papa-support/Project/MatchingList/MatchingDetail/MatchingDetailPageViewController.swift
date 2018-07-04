


import UIKit

class MatchingDetailPageViewController: UIPageViewController {
    
    let firstView: UIViewController = MatchingDetailViewController()
    // 前画面で選択されたCollectionCellのindexPath.row
    var indexPathRowOfCell = MatchingListPresenter.indexPathRowOfCell
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = String(indexPathRowOfCell)
        self.delegate = self
        self.dataSource = self
        self.view.backgroundColor = UIColor.white
        self.setViewControllers([getFirst(index: self.indexPathRowOfCell)], direction: .forward, animated: false, completion: nil)
        print("MatchingDetailPageViewController:\(indexPathRowOfCell)")
        // Navigationbar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "add", style: .plain, target: self, action: #selector(clickRightButton))
    }
    override func viewDidAppear(_ animated: Bool) {
        self.title = String(indexPathRowOfCell)
    }
    // rightButton
    @objc func clickRightButton() {
        let alertController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        // Favorite
        let favoriteAction = UIAlertAction(title: "お気に入りに追加する", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
        })
        // Report
        let reportAction = UIAlertAction(title: "違反報告する", style: .default, handler: {(action:UIAlertAction!) -> Void in
            let next = ViolationReportViewController()
            self.navigationController?.pushViewController(next, animated: true)
        })
        // Block
        let blockAction = UIAlertAction(title: "ブロックする", style: .default, handler: {(action:UIAlertAction!) -> Void in
            self.setBlockButton()
        })
        // Cancel
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: {(action:UIAlertAction!) -> Void in
        })
        // add action
        alertController.addAction(favoriteAction)
        alertController.addAction(reportAction)
        alertController.addAction(blockAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    // blockButton
    func setBlockButton() {
        let blockController: UIAlertController = UIAlertController(title: nil, message: "ブロックします。よろしいですか？", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "キャンセル", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
        })
        let blockAction = UIAlertAction(title: "ブロック", style: .destructive, handler: {(action:UIAlertAction!) -> Void in
        })
        blockController.addAction(cancelAction)
        blockController.addAction(blockAction)
        
        present(blockController, animated: true, completion: nil)
    }
    // firstViewController
    func getFirst(index: Int) -> (UIViewController) {
        // indexPathを保存
        MatchingListPresenter.indexPathRowOfCell = indexPathRowOfCell
        let firstView: UIViewController = MatchingDetailViewController()
        return firstView
    }
}

// MARK: UIPageViewControllerDelegate and DataSource
extension MatchingDetailPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    // left
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if (indexPathRowOfCell <= 0) {return nil}
        else {return getNext(index: indexPathRowOfCell - 1)}
    }
    // right
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if (indexPathRowOfCell < 0) {return nil}
        else {return getNext(index: indexPathRowOfCell + 1)}
    }
    // NextViewController
    func getNext(index: Int) -> (UIViewController) {
        indexPathRowOfCell = index // <- indexPathRowOfCellに通知
        MatchingListPresenter.indexPathRowOfCell = indexPathRowOfCell // <- Presenterに通知
        self.title = String(indexPathRowOfCell) // <- titleを変更
        let nextView: UIViewController = MatchingDetailViewController()
        return nextView
    }
}

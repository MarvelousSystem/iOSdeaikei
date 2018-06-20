


import UIKit

class MatchingDetailPageViewController: UIPageViewController {
    
    let scrollView: UIScrollView = UIScrollView()
    let firstView: UIViewController = MatchingDetailViewController()
    // 前画面で選択されたCollectionCellのindexPath.row
    var indexPathRowOfCell = MatchingListPresenter.indexPathRowOfCell
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        self.view.backgroundColor = UIColor.white
        self.setViewControllers([getFirst(index: self.indexPathRowOfCell)], direction: .forward, animated: false, completion: nil)
        print("MatchingDetailPageViewController:\(indexPathRowOfCell)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // firstViewController
    func getFirst(index: Int) -> (UIViewController) {
        // indexPathを保存
        MatchingListPresenter.indexPathRowOfCell = indexPathRowOfCell
        let firstView: UIViewController = MatchingDetailViewController()
        return firstView
    }
    func setScrollView() {
        self.scrollView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - (self.navigationController?.navigationBar.bounds.height)! * 2)
    }
}

// MARK: UIPageViewControllerDelegate and DataSource
extension MatchingDetailPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    // left
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if (indexPathRowOfCell <= 1) {return nil}
        else {return getNext(index: indexPathRowOfCell - 1)}
    }
    // right
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if (indexPathRowOfCell <= 1) {return nil}
        else {return getNext(index: indexPathRowOfCell + 1)}
    }
    // NextViewController
    func getNext(index: Int) -> (UIViewController) {
        // indexPathを保存
        indexPathRowOfCell = index // <- indexPathRowOfCellに通知
        MatchingListPresenter.indexPathRowOfCell = indexPathRowOfCell // <- Presenterに通知
        let nextView: UIViewController = MatchingDetailViewController()
        return nextView
    }
}

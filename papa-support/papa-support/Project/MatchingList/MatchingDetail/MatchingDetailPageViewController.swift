


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
    }
    override func viewDidAppear(_ animated: Bool) {
        self.title = String(indexPathRowOfCell)
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

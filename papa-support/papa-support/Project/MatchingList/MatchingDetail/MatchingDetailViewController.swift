


import UIKit

class MatchingDetailViewController: UIViewController {
    // 前画面で選択されたCollectionCellのindexPath.row
    let indexPathRowOfCell = MatchingListPresenter.indexPathRowOfCell
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MatchingDetailViewController:\(indexPathRowOfCell)")
        if (indexPathRowOfCell % 2 == 1) {self.view.backgroundColor = UIColor.blue}
        else {self.view.backgroundColor = UIColor.black}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

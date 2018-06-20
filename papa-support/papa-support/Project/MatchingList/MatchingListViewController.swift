


import UIKit
import Foundation

// MARK: vars and lifecycle
class MatchingListViewController: UIViewController {
    // vars
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Layout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 2.5
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 2.5,left: 2.5,bottom: 2.5,right: 2.5)
        flowLayout.itemSize = CGSize(width: DeviceSize.screenWidth / 2 - 2.5 - 1.25 , height: DeviceSize.screenHeight / 3)
        // CollectionView
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: flowLayout)
        collectionView.register(MatchingListCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(MatchingListCollectionViewCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        view.addSubview(collectionView)
        self.view.backgroundColor = UIColor.white
        // Navigationbar
        //let myBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.action, target: self, action: #selector(onClickMyBarButton))
        //self.navigationItem.leftBarButtonItem = myBarButton
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem!.title = "パパ活"
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.topItem!.title = " "
    }
    // TappedEvent
    @objc func addTapped(){
        print("onClickMyBarButton:")
    }
    
}
// MARK: -UICollectionViewDataSource
extension MatchingListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(MatchingListCollectionViewCell.self), for: indexPath) as! MatchingListCollectionViewCell
        let personData = GetPersonDataFromId(id: "未設定")
        let personDataStruct = personData.getData()
        cell.myFaceImage = GetImageFromId.getImage()
        cell.myLivingPlace.text = personDataStruct.livingArea
        cell.myComment.text = personDataStruct.comment
        cell.myAgeLabel.text = personDataStruct.age + "歳"
        cell.myFaceImageView.image = cell.myFaceImage
        //let index = indexPath.section
        return cell
    }
    
}
// MARK: -UICollectionViewDelegate
extension MatchingListViewController: UICollectionViewDelegate {
    
    // When Item was Touched
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        MatchingListPresenter.indexPathRowOfCell = indexPath.row
        let next = MatchingDetailPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.navigationController?.pushViewController(next, animated: true)
    }

}

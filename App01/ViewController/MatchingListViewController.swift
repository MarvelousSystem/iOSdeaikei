//  Created by Miyamoto on 2018/05/21.
//  Copyright © 2018年 MiyamotoSota. All rights reserved.

import UIKit
import Foundation

// MARK: vars and lifecycle
class MatchingListViewController: UIViewController {
    
    //宣言
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // レイアウト作成
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 2.5
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 2.5,left: 2.5,bottom: 2.5,right: 2.5)
        flowLayout.itemSize = CGSize(width: DeviceSize.screenWidth / 2 - 2.5 - 1.25 , height: DeviceSize.screenHeight / 3)
        // コレクションビュー作成
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: flowLayout)
        collectionView.register(MatchingListCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(MatchingListCollectionViewCell.self))
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.gray
        view.addSubview(collectionView)
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
    
    // アイテムタッチ時の処理（UICollectionViewDelegate が必要）
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }

}

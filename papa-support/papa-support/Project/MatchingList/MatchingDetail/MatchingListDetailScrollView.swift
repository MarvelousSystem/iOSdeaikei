


import UIKit

class MatchingListDetailScrollView: UIScrollView {
    
    // vars
    var firstImage: UIImage!
    var firstImageView = UIImageView()
    var comment1Label = UILabel()
    var comment2Label = UILabel()
    var otherImageCollectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black
        self.contentSize = CGSize(width: CGFloat(DeviceSize.screenWidth), height: CGFloat(DeviceSize.screenHeight * 3))
        setProfileImageView()
        setMarginView()
        //setOtherImageCollectionView()
        setOtherImageScrollView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // firstImageView
    func setProfileImageView() {
        firstImageView.backgroundColor = UIColor.white
        firstImageView.image = firstImage
        firstImageView.frame = CGRect(x: UIScreen.main.bounds.width * 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
        firstImageView.contentMode = UIViewContentMode.scaleAspectFit
        // commentLabel
        comment1Label.frame = CGRect(x: 0, y: firstImageView.bounds.height / 8 * 7, width: firstImageView.bounds.width, height: firstImageView.bounds.height / 8 / 2)
        comment1Label.textColor = UIColor.white
        firstImageView.addSubview(comment1Label)
        // commentLabel
        comment2Label.frame = CGRect(x: 0, y: firstImageView.bounds.height / 8 * 7 + firstImageView.bounds.height / 8 / 2, width: firstImageView.bounds.width, height: firstImageView.bounds.height / 8 / 2)
        comment2Label.textColor = UIColor.white
        firstImageView.addSubview(comment2Label)
        self.addSubview(firstImageView)
    }
    // MarginView
    func setMarginView() {
        let const = self.firstImageView.bounds.height
        let const2 = CGFloat(DeviceSize.screenHeight - DeviceSize.statusBarHeight - DeviceSize.navigationbarHeight) - const
        let marginView: UIView = UIView(frame: CGRect(x: 0, y: const, width: CGFloat(DeviceSize.screenWidth), height: const2 / 9 * 2))
        marginView.backgroundColor = UIColor.white
        let likedLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: marginView.bounds.width / 2, height: marginView.bounds.height))
        likedLabel.text = "　 ♡いいね"
        likedLabel.font = UIFont.boldSystemFont(ofSize: 22)
        marginView.addSubview(likedLabel)
        self.addSubview(marginView)
    }
    // OtherImageCollectionView
    func setOtherImageCollectionView() {
        let const = self.firstImageView.bounds.height
        let const2 = CGFloat(DeviceSize.screenHeight - DeviceSize.statusBarHeight - DeviceSize.navigationbarHeight) - const
        otherImageCollectionView = UICollectionView(frame: CGRect(x: 0, y: const + const2 / 9 * 2, width: CGFloat(DeviceSize.screenWidth), height: const2 / 9 * 4))
        otherImageCollectionView.register(MatchingListCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(MatchingListCollectionViewCell.self))
        otherImageCollectionView.backgroundColor = UIColor.white
        //self.otherImageCollectionView.delegate = self
        //self.otherImageCollectionView.dataSource = self
        
        self.addSubview(otherImageCollectionView)
    }
    // otherImageScrollView
    func setOtherImageScrollView() {
        let const = self.firstImageView.bounds.height
        let const2 = CGFloat(DeviceSize.screenHeight - DeviceSize.statusBarHeight - DeviceSize.navigationbarHeight) - const
        // otherImageScrollView
        let otherImageScrollView: UIScrollView = UIScrollView()
        otherImageScrollView.frame = CGRect(x: 0, y: const + const2 / 9 * 2, width: CGFloat(DeviceSize.screenWidth), height: CGFloat(DeviceSize.screenHeight - DeviceSize.statusBarHeight * 2 - DeviceSize.navigationbarHeight * 2) - const - const2 / 9 * 2)
        otherImageScrollView.backgroundColor = UIColor.white
        self.addSubview(otherImageScrollView)
    }
}
/*
extension MatchingListDetailScrollView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(MatchingListCollectionViewCell.self),for: indexPath) as! MatchingListCollectionViewCell
        return cell
    }
}
 */




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
        firstImageView.contentMode = UIView.ContentMode.scaleAspectFit
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
        let const                  = self.firstImageView.bounds.height
        let const2                 = CGFloat(DeviceSize.screenHeight - DeviceSize.statusBarHeight - DeviceSize.navigationbarHeight) - const
        let marginView: UIView     = UIView(frame: CGRect(x: 0, y: const, width: CGFloat(DeviceSize.screenWidth), height: const2 / 9 * 2.3))
        marginView.backgroundColor = UIColor.white
        let likedLabel: UILabel    = UILabel(frame: CGRect(x: 0, y: 0, width: marginView.bounds.width / 2, height: marginView.bounds.height))
        likedLabel.text            = "　 ♡いいね"
        likedLabel.font            = UIFont.boldSystemFont(ofSize: 22)
        marginView.addSubview(likedLabel)
        self.addSubview(marginView)
    }
    // otherImageScrollView
    func setOtherImageScrollView() {
        let const = self.firstImageView.bounds.height
        let const2 = CGFloat(DeviceSize.screenHeight - DeviceSize.statusBarHeight - DeviceSize.navigationbarHeight) - const
        // otherImageScrollView
        let otherImageScrollView: UIScrollView = UIScrollView()
        otherImageScrollView.frame             = CGRect(x: 0, y: const + const2 / 9 * 2.3, width: CGFloat(DeviceSize.screenWidth * 2), height: CGFloat(DeviceSize.screenHeight - DeviceSize.statusBarHeight * 2 - DeviceSize.navigationbarHeight * 2) - const - const2 / 9 * 2.3)
        otherImageScrollView.backgroundColor   = UIColor.white
        otherImageScrollView.isScrollEnabled   = true
        // ImageViews
        let count: Int = 5 //<- テスト
        for i in 0..<count {
            let imageViewSideLength: CGFloat = otherImageScrollView.bounds.height
            let imageViewMargin: CGFloat     = otherImageScrollView.bounds.height / 20
            let imageView: UIImageView       = UIImageView(frame: CGRect(x: (imageViewSideLength + imageViewMargin) * CGFloat(i), y: 0, width: imageViewSideLength, height: imageViewSideLength))
            imageView.image = #imageLiteral(resourceName: "c2015419-111-e1429434329480.jpg")
            otherImageScrollView.addSubview(imageView)
        }
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

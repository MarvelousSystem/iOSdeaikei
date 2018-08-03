//
//  ImageViewController.swift
//  ToolbarView
//
//  Created by Ricky on 2018/07/11.
//  Copyright © 2018年 Ricky. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController,UINavigationBarDelegate, UIScrollViewDelegate {
    
    private let ScrollView = UIScrollView()
    private let Imageview = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        set_ScrollView()
        set_ImageView()
        set_Navigationbar()
    }
    override func viewWillAppear(_ animated: Bool) {
        if let Imagebase64String = UserDefaults.standard.string(forKey: "findphoto"){
            let decodedData:Data = NSData(base64Encoded:Imagebase64String, options:NSData.Base64DecodingOptions()) as! Data
            Imageview.image = UIImage(data: decodedData)
            UserDefaults.standard.removeObject(forKey: "findphoto")
        }
        print(self.navigationItem.title)
    }
    
    func set_ScrollView(){
        self.ScrollView.delegate = self
        self.ScrollView.minimumZoomScale = 1
        self.ScrollView.maximumZoomScale = 3
        self.ScrollView.isScrollEnabled = true
        self.ScrollView.showsHorizontalScrollIndicator = true
        self.ScrollView.showsVerticalScrollIndicator = true
        ScrollView.frame = CGRect(x:0, y:0, width:DeviceSize.screenWidth , height:DeviceSize.screenHeight)
        self.view.addSubview(ScrollView)
    }
    func set_ImageView(){
        Imageview.frame = CGRect(x:0, y:15, width:DeviceSize.screenWidth , height:DeviceSize.screenHeight-15)
        Imageview.contentMode = .scaleAspectFit
        Imageview.isUserInteractionEnabled = true
        let doubleTapGesture = UITapGestureRecognizer(target: self, action:#selector(self.tappedImage(_:)))
        doubleTapGesture.numberOfTapsRequired = 2
        Imageview.addGestureRecognizer(doubleTapGesture)
        self.ScrollView.addSubview(Imageview)
    }
    
    @objc func tappedImage(_ sender: UITapGestureRecognizer){
        print("taped")
        print(self.ScrollView.zoomScale)
        if ( self.ScrollView.zoomScale < self.ScrollView.maximumZoomScale ) {
            let NewScale:CGFloat = self.ScrollView.zoomScale * 3
            let ZoomRect:CGRect = self.zoomRectForScale(scale: NewScale, center: sender.location(in: sender.view))
            self.ScrollView.zoom(to: ZoomRect, animated: true)
            
        } else {
            self.ScrollView.setZoomScale(1.0, animated: true)
        }
    }
    func zoomRectForScale(scale:CGFloat, center: CGPoint) -> CGRect{
        var zoomRect: CGRect = CGRect()
        zoomRect.size.height = self.ScrollView.frame.size.height / scale
        zoomRect.size.width = self.ScrollView.frame.size.width / scale
        
        zoomRect.origin.x = center.x - zoomRect.size.width / 2.0
        zoomRect.origin.y = center.y - zoomRect.size.height / 2.0
        
        return zoomRect
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.Imageview
    }
    
}

//MARK Navigationbar UI
extension ImageViewController :UINavigationControllerDelegate{
    func set_Navigationbar(){
        set_barButton()
        //        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //        self.navigationController!.navigationBar.shadowImage = UIImage()
        //self.navigationItem.title = name
        //        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white,
        //                                                                        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20.0)] as [NSAttributedString.Key : Any]
    }
    func set_barButton(){
        let Download_btn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: #selector(Download(_:)))
        self.navigationItem.setRightBarButton(Download_btn , animated: true)
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        let Back_btn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.stop, target: self, action: #selector(Close_ImageView(_:)))
        self.navigationItem.setLeftBarButton(Back_btn , animated: true)
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
        
    }
    @objc func Download(_ sender:UIButton){
        print("Download")
        InfoView_apper()
        UIImageWriteToSavedPhotosAlbum(Imageview.image!, nil, nil, nil)
        
    }
    @objc func Close_ImageView(_ sender:UIButton){
        print("Close")
        self.navigationController?.popViewController(animated: true)
    }
    func InfoView_apper(){
        let alert: UIAlertController = UIAlertController(title: "保存しました", message: "", preferredStyle:  UIAlertController.Style.alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
            (action: UIAlertAction!) -> Void in
            print("OK")
        })
        
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }
}




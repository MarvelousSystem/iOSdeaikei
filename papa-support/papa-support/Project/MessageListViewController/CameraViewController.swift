//
//  CameraViewController.swift
//  ToolbarView
//
//  Created by Ricky on 2018/07/04.
//  Copyright © 2018年 Ricky. All rights reserved.
//

import UIKit
import AVFoundation
class CameraViewController: UIViewController, AVCapturePhotoCaptureDelegate {
    
    private var captureSesssion: AVCaptureSession!
    private var stillImageOutput: AVCapturePhotoOutput?
    private var stillImageInput:AVCaptureDeviceInput!
    private var previewLayer: AVCaptureVideoPreviewLayer?
    private var Device = AVCaptureDevice.default(for: AVMediaType.video)
    private var camera_dir = AVCaptureDevice.Position.back
    private var photo:UIImage?
    private let CameraView = UIView()
    private let PhotoView = UIImageView()
    private let ToolbarView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        set_PhotoView()
        set_CameraView()
    }
    override func viewWillAppear(_ animated: Bool) {
        set_session()
    }
    override func viewDidDisappear(_ animated: Bool) {
        // camera stop メモリ解放
        captureSesssion?.stopRunning()
        for output in (captureSesssion?.outputs)! {
            //session.removeOutput((output as? AVCaptureOutput)!)
            captureSesssion?.removeOutput(output)
        }
        for input in (captureSesssion?.inputs)! {
            //session.removeInput((input as? AVCaptureInput)!)
            captureSesssion?.removeInput(input)
        }
        captureSesssion = nil
        Device = nil
    }
    
    func set_session(){
        captureSesssion = AVCaptureSession()
        stillImageOutput = AVCapturePhotoOutput()
        //カメラのtype,向きを設定
        Device = AVCaptureDevice.default(
            AVCaptureDevice.DeviceType.builtInWideAngleCamera,
            for: AVMediaType.video,
            position: camera_dir)
        do {
            let input = try AVCaptureDeviceInput(device: Device!)
            // 入力
            if (captureSesssion.canAddInput(input)) {
                captureSesssion.addInput(input)
                // 出力
                if (captureSesssion.canAddOutput(stillImageOutput!)) {
                    captureSesssion.addOutput(stillImageOutput!)
                    captureSesssion.startRunning() // カメラ起動
                    previewLayer?.accessibilityFrame = self.CameraView.frame
                    previewLayer = AVCaptureVideoPreviewLayer(session: captureSesssion)
                    previewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill// アスペクトフィット
                    previewLayer?.frame = self.CameraView.bounds
                    CameraView.layer.addSublayer(previewLayer!)
                    previewLayer?.position = CGPoint(x: self.CameraView.frame.width / 2, y: self.CameraView.frame.height / 2)
                    previewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait // カメラの向き
                }
            }
        }
        catch {
            print(error)
        }
    }
    func photoOutput(_ output: AVCapturePhotoOutput,
                     didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        // AVCapturePhotoOutput.jpegPhotoDataRepresentation deprecated in iOS11
        let imageData = photo.fileDataRepresentation()
        self.photo = UIImage(data: imageData!)!
        PhotoView.contentMode = .scaleAspectFill
        PhotoView.image = self.photo
    }
    
}
//MAKE Camera_ViewUI
extension CameraViewController{
    func set_CameraView(){
        CameraView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height-80)
        self.view.addSubview(CameraView )
        set_CameraViewUI()
    }
    func set_CameraViewUI(){
        ToolbarView.frame = CGRect(x: 0, y: self.view.frame.height-80, width: self.view.frame.width, height: 80)
        ToolbarView.backgroundColor = UIColor.black
        
        let Cancle_Btn = UIButton()
        Cancle_Btn.frame = CGRect(x: 0, y: 20, width:100, height: 50)
        Cancle_Btn.setTitle("キャンセル", for: .normal)
        Cancle_Btn.tintColor = UIColor.white
        Cancle_Btn.addTarget(self, action: #selector(Close_Btn_event(_ :)), for: .touchUpInside)
        ToolbarView.addSubview(Cancle_Btn)
        
        let Take_Btn = UIButton()
        Take_Btn.frame = CGRect(x: ToolbarView.frame.width/2-40, y:20, width: 80, height: 50)
        Take_Btn.backgroundColor = UIColor.black
        Take_Btn.setTitle("◉", for: .normal)
        Take_Btn.titleLabel?.font = UIFont.systemFont(ofSize: 70)
        Take_Btn.tintColor = UIColor.white
        Take_Btn.addTarget(self, action: #selector(Take_Btn_event(_ :)), for: .touchUpInside)
        ToolbarView.addSubview(Take_Btn)
        
        let ChangeDire_Btn = UIButton()
        ChangeDire_Btn.frame = CGRect(x: ToolbarView.frame.width-80, y:Take_Btn.frame.minY, width: 60, height: 55)
        ChangeDire_Btn.tintColor = UIColor.white
        ChangeDire_Btn.setBackgroundImage(UIImage(named: "dire.png"), for: .normal)
        ChangeDire_Btn.addTarget(self, action: #selector(ChangeDire_Btn_event(_ :)), for: .touchUpInside)
        ToolbarView.addSubview(ChangeDire_Btn)
        
        ToolbarView.bringSubviewToFront(Cancle_Btn)
        ToolbarView.bringSubviewToFront(Take_Btn)
        ToolbarView.bringSubviewToFront(ChangeDire_Btn)
        self.view.addSubview(ToolbarView)
    }
    @objc func Close_Btn_event(_ sender:UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    @objc func Take_Btn_event(_ sender:UIButton){
        print("take photo")
        CameraView.alpha = 0
        ToolbarView.alpha = 0
        PhotoView.alpha = 1
        let settingsForMonitoring = AVCapturePhotoSettings()
        settingsForMonitoring.isAutoStillImageStabilizationEnabled = false
        settingsForMonitoring.isHighResolutionPhotoEnabled = false
        stillImageOutput?.capturePhoto(with: settingsForMonitoring, delegate: self)
    }
    @objc func ChangeDire_Btn_event(_ sender:UIButton){
        if(Device?.position == .back){
            camera_dir = AVCaptureDevice.Position.front
        }else{
            camera_dir = AVCaptureDevice.Position.back
        }
        set_session()
        print("change Camera_dire")
    }
}
//MAKE Photo_ViewUI
extension CameraViewController{
    func set_PhotoView(){
        PhotoView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height-80)
        self.view.addSubview(PhotoView )
        set_PhotoViewUI()
    }
    func set_PhotoViewUI(){
        let View = UIView()
        View.frame = CGRect(x: 0, y: self.view.frame.height-80, width: self.view.frame.width, height: 80)
        View.backgroundColor = UIColor.black
        
        let Cancle_Btn = UIButton()
        Cancle_Btn.frame = CGRect(x: 0, y: 20, width: 100, height: 50)
        Cancle_Btn.setTitle("キャンセル", for: .normal)
        Cancle_Btn.tintColor = UIColor.white
        Cancle_Btn.addTarget(self, action: #selector(Close_PhotoView(_ :)), for: .touchUpInside)
        View.addSubview(Cancle_Btn)
        
        let SavePhoto_Btn = UIButton()
        SavePhoto_Btn.frame = CGRect(x: View.frame.width-120, y:Cancle_Btn.frame.minY, width: 100, height: 60)
        SavePhoto_Btn.tintColor = UIColor.white
        SavePhoto_Btn.setTitle("使用する", for: .normal)
        SavePhoto_Btn.addTarget(self, action: #selector(Save_Btn_event(_ :)), for: .touchUpInside)
        View.addSubview(SavePhoto_Btn)
        View.bringSubviewToFront(Cancle_Btn)
        View.bringSubviewToFront(SavePhoto_Btn)
        self.view.addSubview(View)
    }
    @objc func Close_PhotoView(_ sender:UIButton){
        self.PhotoView.alpha = 0
        //一時期保存写真を消す
        self.photo = UIImage(named: "")
        PhotoView.image = self.photo
        ToolbarView.alpha = 1
        CameraView.alpha = 1
    }
    @objc func Save_Btn_event(_ sender:UIButton){
        print("SAVE")
        // アルバムに追加.
        //        UIImageWriteToSavedPhotosAlbum(PhotoView.image!, self, nil, nil)
        //        self.PhotoView.alpha = 0
        //        ToolbarView.alpha = 1
        //        CameraView.alpha = 1
        //UIImageを64bit_Stringに変換
        let data  = PhotoView.image!.jpegData(compressionQuality: 1)
        let base64String = data!.base64EncodedString()
        
        UserDefaults.standard.set(base64String, forKey: "findphoto")
        self.dismiss(animated: true, completion: nil)
        
        
    }
}


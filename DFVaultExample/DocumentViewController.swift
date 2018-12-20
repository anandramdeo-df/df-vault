//
//  DocumentViewController.swift
//  DFVaultExample
//
//  Created by Ranosys_ShubhamAgarwal on 30/11/18.
//  Copyright © 2018 Ranosys_ShubhamAgarwal. All rights reserved.
//

import UIKit
import DFDocument
import DFAPIFramework

class DocumentViewController: UIViewController {

    @IBOutlet weak var captureBackToggle: UISwitch!
    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var uploadButton: UIButton!

    var frontImage: UIImage?
    var backImage: UIImage?
    var assetData: [String : Any]?


    override func viewDidLoad() {
        super.viewDidLoad()
//        self.openViewWithConfiguration()


        if let uploadData = assetData {
            frontImageView.image = frontImage ?? UIImage()
            backImageView.image = backImage ?? UIImage()

            var mediaArray = [MultipartDataModal]()
            if let imageData = frontImage?.resizeImageToUploadOnServer(maxSizeInKB: 5000) {
                mediaArray.append(MultipartDataModal.init(type: .image, fileName: "front_image", data: imageData))
            }

            if let img = backImage {
                let imageData = img.resizeImageToUploadOnServer(maxSizeInKB: 5000)
                mediaArray.append(MultipartDataModal.init(type: .image, fileName: "back_image", data: imageData))
            }

            let activityIndicator = UIView().showActivity()
            self.view.addSubview(activityIndicator)

            ConnectionManager.instance.getOCRResultFromImage(multipartDataArray: mediaArray, assetSubTypeName: uploadData["asset_type"] as! String, success: { (response) in
                activityIndicator.removeFromSuperview()

                if let responseObj = response as? [String: Any] {
                    self.requestForPostScannedData(parameters: responseObj, assetData: uploadData)
                }
//                let alert =  UIAlertController.init(title: "Success", message: "Your document has been uploaded successfully", preferredStyle: .alert)
//                let okAction = UIAlertAction.init(title: "Ok", style: .default, handler: {
//                })
//
//                alert.addAction(okAction)
//                self.navigationController?.present(alert, animated: true, completion: nil)
            }, failure: { (error) in
                activityIndicator.removeFromSuperview()

            })

        }
    }
    
    func requestForPostScannedData(parameters: [String: Any], assetData: [String: Any]) {
        self.view.endEditing(true)
       
        if let data = parameters["data"] as? [String: Any] , var par = data["properties"] as? [String: Any], let assetType =  assetData["asset_type"] as? String {
            par["geo_latitude"] = "26.778544149326056" as AnyObject
            par["geo_longitude"] = "75.84157027980591" as AnyObject
            par["asset_type"] = assetType
            par["is_right_to_work"] = false as AnyObject
/*              let p = ["nationality": "Vietnam", "last_name": "Hạnh", "birth_date": "1986-04-26", "first_name": "Nguyễn", "asset_type": "Identity Card", "address": "178 Phố Chợ Khâm Thiên Trung Phụng, Đống Đa, Hà Nội", "identity_number": "000186000015", "middle_name": "Đức", "gender": "Female", "expiry_date": "2030-01-07", "is_right_to_work": "0", "geo_latitude": "13.4578945", "geo_longitude": "45.123452"] as [String: AnyObject]
             
             param: Optional(["nationality": United Kingdom, "geo_longitude": 75.84142126420033, "last_name": Specimen, "passport_number": 605100803, "is_right_to_work": 0, "first_name": A, "birth_date": 1950-01-01, "asset_type": Passport, "expiry_date": 2017-01-24, "geo_latitude": 26.77838545008835, "gender": Male, "timezone": Asia/Kolkata])
 */
            ConnectionManager.instance.addUpdateAssetDetail(assetSubTypeParent: "identity", assetDetailId: nil, parametersDict: par as [String : AnyObject], success: { response in
                
                if let successMessage = response?.value(forKey: "message") as? String {
                    print(successMessage)
                }
            }, failure: { error in
                
                if let errorInfo = error?.userInfo {
                    print(errorInfo)
                }
                print("Error: \(error?.localizedDescription ?? "error not mentioned")")
            })
        }
    }

    func convertIntoData(image: UIImage) -> Data? {
        return image.jpegData(compressionQuality: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClick(_ sender: Any) {
        self.unlockDFDocument(completionHandler: {[weak self] frontImage, backImage in
            self?.updateImages(image1: frontImage, image2: backImage)
        })
    }
    
    @IBAction func onClickUploadImages(_ sender: Any) {

        // To upload scanned document follow these steps:

        // 1. Call "getOCRResultFromImage" API to call OCR data
        // 2. Now with the response from above API call the "addUpdateAssetDetail" API upload document.
    }

    func updateImages(image1: UIImage, image2: UIImage?) {
        frontImageView.layer.borderWidth = 1
        frontImageView.layer.borderColor = UIColor.black.cgColor
        frontImageView.image = image1
        if image2 != nil {
            backImageView.layer.borderWidth = 1
            backImageView.layer.borderColor = UIColor.black.cgColor
            backImageView.image = image2
        }
        uploadButton.isHidden = false
    }

}

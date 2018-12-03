//
//  DocumentViewController.swift
//  DFVaultExample
//
//  Created by Ranosys_ShubhamAgarwal on 30/11/18.
//  Copyright © 2018 Ranosys_ShubhamAgarwal. All rights reserved.
//

import UIKit
import DFDocument

class DocumentViewController: UIViewController {

    @IBOutlet weak var captureBackToggle: UISwitch!
    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var uploadButton: UIButton!

    var frontImage: UIImage?
    var backImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.openViewWithConfiguration()

        frontImageView.image = frontImage ?? UIImage()
        backImageView.image = backImage ?? UIImage()
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

//
//  ViewController.swift
//  DFVaultExample
//
//  Created by Ranosys_ShubhamAgarwal on 29/11/18.
//  Copyright © 2018 Ranosys_ShubhamAgarwal. All rights reserved.
//

import UIKit
import DFVault
import DFDocument

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Vault Framework"
        doCornerRadius(radius: 18, bview: button1)
        doCornerRadius(radius: 18, bview: button2)
        doCornerRadius(radius: 18, bview: button3)
        doCornerRadius(radius: 18, bview: button4)
        doCornerRadius(radius: 18, bview: button5)
        doCornerRadius(radius: 18, bview: button6)
        doCornerRadius(radius: 18, bview: button7)
        
    }
    
    func doCornerRadius(radius: CGFloat, bview: UIView) {
        bview.layer.cornerRadius = radius
    }
    
    @IBAction func ShareAssetByEmail(_ sender: Any) {
        
        let ShareAssetByEmail = DFVault()
        ShareAssetByEmail.type = .shareAsset
        ShareAssetByEmail.backgroundColor = #colorLiteral(red: 0.9137254902, green: 0.3921568627, blue: 0.3647058824, alpha: 1)
        ShareAssetByEmail.navigationBarColor = #colorLiteral(red: 0.4039215686, green: 0.7098039216, blue: 0.3647058824, alpha: 1)
        ShareAssetByEmail.navigationTitleColor = UIColor.black
        ShareAssetByEmail.navigationBarTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        ShareAssetByEmail.navigationCancelButtonText = "Dismiss"
        ShareAssetByEmail.navigationTitle = "Share Email"
        ShareAssetByEmail.textfieldCornerRadius = 5
        ShareAssetByEmail.buttonCornerRadius = 20
        ShareAssetByEmail.buttonBorderWidth = 1
        ShareAssetByEmail.buttonTitle = "Share Email"
        
        ShareAssetByEmail.buttonBorderColor = UIColor.white
        ShareAssetByEmail.buttonTitleColor = UIColor.white
        ShareAssetByEmail.buttonColor = #colorLiteral(red: 0.4039215686, green: 0.7098039216, blue: 0.3647058824, alpha: 1)
        // ShareAssetByEmail.leftBarImage = UIImage(named: "new1")
        ShareAssetByEmail.getResult(success: { (response) in
            print(response)
        }, failure: { (error) in
            print(error?.userInfo ?? "Your api token is not valid")
        })
        
    }
    
    @IBAction func AssetVault(_ sender: Any) {
        
        let AssetVault = DFVault()
        AssetVault.type = .assetVault
        AssetVault.backgroundColor = #colorLiteral(red: 0.9137254902, green: 0.3921568627, blue: 0.3647058824, alpha: 1)
        AssetVault.navigationBarColor = #colorLiteral(red: 0.4039215686, green: 0.7098039216, blue: 0.3647058824, alpha: 1)
        AssetVault.navigationTitleColor = UIColor.white
        AssetVault.navigationBarTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        AssetVault.gradiantStartColor = #colorLiteral(red: 0.4039215686, green: 0.7098039216, blue: 0.3647058824, alpha: 1)
        AssetVault.gradiantMidColor = #colorLiteral(red: 0.4039215686, green: 0.7098039216, blue: 0.3647058824, alpha: 1)
        AssetVault.gradiantEndColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        AssetVault.navigationCancelButtonText = "Dismiss"
        AssetVault.userData = self.getJsondata(filename: "AssetVault")
        AssetVault.getResult(success: { (response) in
            print(response)
        }, failure: { (error) in
            print(error?.userInfo ?? "Your api token is not valid")
        })
    }
    
    @IBAction func ShareWithMe(_ sender: Any) {
        
        let shareWithMeObj = DFVault()
        shareWithMeObj.type = .shareWithMeList
        shareWithMeObj.backgroundColor = #colorLiteral(red: 0.9137254902, green: 0.3921568627, blue: 0.3647058824, alpha: 1)
        shareWithMeObj.navigationBarColor = #colorLiteral(red: 0.4039215686, green: 0.7098039216, blue: 0.3647058824, alpha: 1)
        shareWithMeObj.navigationTitleColor = UIColor.white
        shareWithMeObj.navigationBarTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        shareWithMeObj.cellColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        shareWithMeObj.cellHeadingColor = UIColor.red
        shareWithMeObj.cellSubHeadingColor = UIColor.red
        shareWithMeObj.userData = self.getJsondata(filename: "ShareWithMe")
        shareWithMeObj.getResult(success: { (response) in
            print(response)
        }, failure: { (error) in
            print(error?.userInfo ?? "Your api token is not valid")
        })
    }
    
    
    @IBAction func ShareByMe(_ sender: Any) {
        let shareByMe = DFVault()
        shareByMe.type = .shareByMeList
        shareByMe.backgroundColor = #colorLiteral(red: 0.9137254902, green: 0.3921568627, blue: 0.3647058824, alpha: 1)
        shareByMe.navigationBarColor = #colorLiteral(red: 0.4039215686, green: 0.7098039216, blue: 0.3647058824, alpha: 1)
        shareByMe.navigationTitleColor = UIColor.white
        shareByMe.navigationBarTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        shareByMe.cellColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        shareByMe.cellHeadingColor = UIColor.red
        shareByMe.cellSubHeadingColor = UIColor.red
        shareByMe.revokeAccessTitle = "Revoke"
        shareByMe.revokeAccessColor = UIColor.red
        shareByMe.editAccessTitle = "Edit"
        shareByMe.editButtonColor = UIColor.blue
        shareByMe.userData = self.getJsondata(filename: "ShareByMe")
        shareByMe.getResult(success: { (response) in
            print(response)
        }, failure: { (error) in
            print(error?.userInfo ?? "Your api token is not valid")
        })
    }
    
    
    @IBAction func OrganisationRequestforAsset(_ sender: Any) {
        
        let OrganisationRequestforAsset = DFVault()
        OrganisationRequestforAsset.type = .organizationRequesetedAssetList
        OrganisationRequestforAsset.backgroundColor = #colorLiteral(red: 0.9137254902, green: 0.3921568627, blue: 0.3647058824, alpha: 1)
        OrganisationRequestforAsset.navigationBarColor = #colorLiteral(red: 0.4039215686, green: 0.7098039216, blue: 0.3647058824, alpha: 1)
        OrganisationRequestforAsset.navigationTitleColor = UIColor.white
        OrganisationRequestforAsset.navigationBarTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        OrganisationRequestforAsset.cellColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        OrganisationRequestforAsset.cellSubHeadingColor = UIColor.black
        OrganisationRequestforAsset.cellHeadingColor = UIColor.black
        OrganisationRequestforAsset.grantAccessTitle = "Grant"
        OrganisationRequestforAsset.denyAccessTitle = "Deny"
        OrganisationRequestforAsset.grantAccessColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        OrganisationRequestforAsset.denyAccessColor = UIColor.red
        OrganisationRequestforAsset.userData = self.getJsondata(filename: "OrganisationRequestforAsset")
        OrganisationRequestforAsset.getResult(success: { (response) in
            print(response)
        }, failure: { (error) in
            print(error?.userInfo ?? "Your api token is not valid")
        })
    }
    
    @IBAction func OrganisationRequestforAllAsset(_ sender: Any) {
        
        let OrganisationRequestforAllAsset = DFVault()
        OrganisationRequestforAllAsset.type = .organizationUploadAllAssetRequestList
        OrganisationRequestforAllAsset.backgroundColor = #colorLiteral(red: 0.9137254902, green: 0.3921568627, blue: 0.3647058824, alpha: 1)
        OrganisationRequestforAllAsset.navigationBarColor = #colorLiteral(red: 0.4039215686, green: 0.7098039216, blue: 0.3647058824, alpha: 1)
        OrganisationRequestforAllAsset.navigationTitleColor = UIColor.white
        OrganisationRequestforAllAsset.navigationBarTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        OrganisationRequestforAllAsset.cellColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        OrganisationRequestforAllAsset.grantAccessColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        OrganisationRequestforAllAsset.denyAccessColor = UIColor.red
        OrganisationRequestforAllAsset.navigationTitle = "All asset"
        OrganisationRequestforAllAsset.userData = self.getJsondata(filename: "OrganisationRequestforAllAsset")
        OrganisationRequestforAllAsset.getResult(success: { (response) in
            print(response)
        }, failure: { (error) in
            print(error?.userInfo ?? "Your api token is not valid")
        })
    }
    
    @IBAction func UploadAssetRequest (_ sender: Any) {
        let UploadAssetRequest = DFVault()
        UploadAssetRequest.type = .organizationUploadAssetRrequestList
        UploadAssetRequest.backgroundColor = #colorLiteral(red: 0.9137254902, green: 0.3921568627, blue: 0.3647058824, alpha: 1)
        UploadAssetRequest.navigationBarColor = #colorLiteral(red: 0.4039215686, green: 0.7098039216, blue: 0.3647058824, alpha: 1)
        UploadAssetRequest.navigationTitleColor = UIColor.white
        UploadAssetRequest.navigationBarTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        UploadAssetRequest.cellColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        UploadAssetRequest.cellSubHeadingColor = UIColor.black
        UploadAssetRequest.cellHeadingColor = UIColor.black
        UploadAssetRequest.uploadButtonColor = UIColor.blue
        UploadAssetRequest.uploadButtonTitle = "Upload"
        UploadAssetRequest.userData = self.getJsondata(filename: "UploadAssetRequest")
        UploadAssetRequest.getResult(success: { (response) in
            print(response)
            self.unlockDFDocument(completionHandler: {[weak self] frontImage, backImage in
                self?.navigateToDocVC(image1: frontImage, image2: backImage)
            })
        }, failure: { (error) in
            print(error?.userInfo ?? "Your api token is not valid")
        })
    }
    
    
    func navigateToDocVC(image1: UIImage, image2: UIImage?) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "DocumentViewController") as? DocumentViewController else {return}
        vc.frontImage = image1
        vc.backImage = image2
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension UIViewController {
    func unlockDFDocument(completionHandler: @escaping ((_ frontImage: UIImage, _ backImage: UIImage?) -> Void)) {
        let vc = DFDocument.sharedInstance
        
        vc.getCapturedImages(success: { frontImage, backImage  in
            print(frontImage)
            completionHandler(frontImage, backImage)
        }, failure: { (error) in
            print(error?.userInfo ?? "Your api token is not valid")
        })
    }
}

extension UIView {
    func showActivity() -> UIView {
        let view = UIView()
        view.frame = UIScreen.main.bounds
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0.2977514022)
        
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.frame = view.bounds
        activityIndicator.startAnimating()
        
        view.addSubview(activityIndicator)
        return view
    }
}

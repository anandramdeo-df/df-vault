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
import DFAPIFramework

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doLogin()
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

    @IBAction func onClickAddButton(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DocumentViewController") as? DocumentViewController else {return}
        navigationController?.pushViewController(vc, animated: true)
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
        ShareAssetByEmail.initialize(success: { [weak self] viewController in
            DispatchQueue.main.async {
                if let vc = viewController {
                    self?.present(vc, animated: true, completion: nil)
                }
            }
            }, failure: { (error) in
                print(error?.userInfo ?? "Your api token is not valid")
        })
        ShareAssetByEmail.passSharingDetails = { (email, reason, sharingPeriod) in
            print(email)
            print(reason)
            print(sharingPeriod)
            ConnectionManager.instance.shareDocumentAsset(comment: reason, assetId: "5c06721c05744f0a4c5e3bc0", time: sharingPeriod, emailArray: [email], success: { (response) in
                print(response)
            }, failure: { (error) in
                print(error)
            })
        }
    }

    @IBAction func AssetVault(_ sender: Any) {
        
        ConnectionManager.instance.getAllSavedAssets(success: { (success) in
            if let responseObj = success as? [String: Any] {
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
                AssetVault.userData = responseObj //self.getJsondata(filename: "AssetVault")
                AssetVault.initialize(success: { [weak self] viewController in
                    DispatchQueue.main.async {
                        if let vc = viewController {
                            self?.present(vc, animated: true, completion: nil)
                        }
                    }
                    }, failure: { (error) in
                        print(error?.userInfo ?? "Your api token is not valid")
                })
            }
            }, failure: { (error) in
                    print(error)
            })
    }

    @IBAction func ShareWithMe(_ sender: Any) {
        
        ConnectionManager.instance.getKeeperInfo(success: { (success) in
            if let responseObj = success as? [String: Any] {
                let shareWithMeObj = DFVault()
                shareWithMeObj.type = .shareWithMeList
                shareWithMeObj.backgroundColor = #colorLiteral(red: 0.9137254902, green: 0.3921568627, blue: 0.3647058824, alpha: 1)
                shareWithMeObj.navigationBarColor = #colorLiteral(red: 0.4039215686, green: 0.7098039216, blue: 0.3647058824, alpha: 1)
                shareWithMeObj.navigationTitleColor = UIColor.white
                shareWithMeObj.navigationBarTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                shareWithMeObj.cellColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
                shareWithMeObj.cellHeadingColor = UIColor.red
                shareWithMeObj.cellSubHeadingColor = UIColor.red
                shareWithMeObj.userData = responseObj //self.getJsondata(filename: "ShareWithMe")
                shareWithMeObj.initialize(success: { [weak self] viewController in
                    DispatchQueue.main.async {
                        if let vc = viewController {
                            self?.present(vc, animated: true, completion: nil)
                        }
                    }
                    }, failure: { (error) in
                        print(error?.userInfo ?? "Your api token is not valid")
                })
            }
        }, failure: { (error) in
            print(error)
        })
    }

    @IBAction func ShareByMe(_ sender: Any) {
        ConnectionManager.instance.requestForShareByMeList(success: { (success) in
            if let responseObj = success as? [String: Any] {
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
                shareByMe.userData = responseObj //self.getJsondata(filename: "ShareByMe")
                shareByMe.initialize(success: { [weak self] viewController in
                    DispatchQueue.main.async {
                        if let vc = viewController {
                            self?.present(vc, animated: true, completion: nil)
                        }
                    }
                    }, failure: { (error) in
                        print(error?.userInfo ?? "Your api token is not valid")
                })
                shareByMe.revokeEditAccessStatus = {revokeData, assetID, newDate in
                    
                    print(revokeData)
                    print(assetID)
                    print(newDate)
                    if let sharedWith = revokeData["email"] as? String, let sharedUpto = revokeData["shared_upto"] as? String, let userId = revokeData["user_id"] as? String {
                        
                        if sharedUpto == newDate {
                            ConnectionManager.instance.revokeAccessOfAssetToOrganisation(assetId: assetID, sharedWith: sharedWith, success: { (success) in
                                print(success)
                            }, failure: { (error) in
                                print(error)
                            })
                        } else {
                            ConnectionManager.instance.editSharingTime(assetId: assetID, newTime: newDate, id: userId, success: { (response) in
                                print(response)
                            }, failure: { (error) in
                                print(error)
                            })
                        }
                    }
                }
            }
        }, failure: { (error) in
            print(error)
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
        OrganisationRequestforAsset.userData = self.getJsondata(filename: "OrganisationRequestforAsset")
        OrganisationRequestforAsset.grantAccessTitle = "Grant"
        OrganisationRequestforAsset.denyAccessTitle = "Deny"
        OrganisationRequestforAsset.grantAccessColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        OrganisationRequestforAsset.denyAccessColor = UIColor.red
        OrganisationRequestforAsset.initialize(success: { [weak self] viewController in
            DispatchQueue.main.async {
                if let vc = viewController {
                    self?.present(vc, animated: true, completion: nil)
                }
            }
            }, failure: { (error) in
                print(error?.userInfo ?? "Your api token is not valid")
        })
        OrganisationRequestforAsset.organizationRequestStatus = { assetData, status, datePeriod in
            print(assetData)
            print(status)
            print(datePeriod)
        }
    }

    @IBAction func UploadAssetRequest (_ sender: Any) {
        let UploadAssetRequest = DFVault()
        UploadAssetRequest.type = .organizationUploadAssetRrequestList
        UploadAssetRequest.backgroundColor = #colorLiteral(red: 0.9137254902, green: 0.3921568627, blue: 0.3647058824, alpha: 1)
        UploadAssetRequest.navigationBarColor = #colorLiteral(red: 0.4039215686, green: 0.7098039216, blue: 0.3647058824, alpha: 1)
        UploadAssetRequest.navigationTitleColor = UIColor.white
        UploadAssetRequest.navigationBarTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
       
        UploadAssetRequest.cellColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        UploadAssetRequest.userData = self.getJsondata(filename: "UploadAssetRequest")
        UploadAssetRequest.cellSubHeadingColor = UIColor.black
        UploadAssetRequest.cellHeadingColor = UIColor.black
        UploadAssetRequest.uploadButtonColor = UIColor.blue
        UploadAssetRequest.uploadButtonTitle = "Upload"
        UploadAssetRequest.initialize(success: { [weak self] viewController in
            DispatchQueue.main.async {
                if let vc = viewController {
                    self?.present(vc, animated: true, completion: nil)
                }
            }
            }, failure: { (error) in
                print(error?.userInfo ?? "Your api token is not valid")
        })
        
        UploadAssetRequest.organizationRequestStatus = { assetData, status, _ in
            print(assetData)
            print(status)

            self.unlockDFDocument(completionHandler: {[weak self] frontImage, backImage in
                self?.navigateToDocVC(image1: frontImage, image2: backImage)
            })
        }
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
        organisationRequestForAllUserAssetsByEmail(success: { (responseObj) in
            if let data = responseObj {
                OrganisationRequestforAllAsset.userData = data// self.getJsondata(filename: "OrganisationRequestforAllAsset")
                OrganisationRequestforAllAsset.initialize(success: { [weak self] viewController in
                    DispatchQueue.main.async {
                        if let vc = viewController {
                            self?.present(vc, animated: true, completion: nil)
                        }
                    }
                    }, failure: { (error) in
                        print(error?.userInfo ?? "Your api token is not valid")
                })
                OrganisationRequestforAllAsset.organizationRequestStatus = { assetData, status, datePeriod in
                    print(assetData)
                    print(status)
                    print(datePeriod)
                    
                    self.uploadAccessOfAllAssetByEmailToOrganisation(identifier: assetData["shared_with"] as! String, status: status, id: assetData["_id"] as! String, timePeriod: datePeriod, success: { (response) in
                        
                    }, failure: { (error) in
                        print(error as Any)
                    })
                }
            }
        }, failure: { (error) in
            print(error as Any)
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

        vc.initialize(success: { [weak self] viewController in
            DispatchQueue.main.async {
                if let vc = viewController {
                    self?.present(vc, animated: true, completion: nil)
                }
            }
            }, failure: { (error) in
                print(error?.userInfo ?? "Your api token is not valid")
        })

        vc.passImage = {[weak self] frontImage, backImage in
            completionHandler(frontImage,backImage)
            self?.dismiss(animated: true, completion: nil)
        }
    }
}

// All API calls
extension ViewController {
    func doLogin() {
        ConnectionManager.instance.doLogin(email: "shubham.agarwal@ranosys.com", password: "password", success: { (success) in
            print(success)
        }, failure: { (error) in
            print(error)
        })
    }
    
    
        
    func organisationRequestForAsset(success: @escaping (( _ responseObject: [String: Any]?) -> Void), failure: @escaping (( _ error: NSError?) -> Void)) {
            ConnectionManager.instance.organisationRequestForAsset(success: { (response) in
                let responseObj = response as? [String: Any]
                success(responseObj)
            }, failure: { (error) in
                failure(error)
            })
        }
        
    func organisationRequestForAllUserAssetsByEmail(success: @escaping (( _ responseObject: [String: Any]?) -> Void), failure: @escaping (( _ error: NSError?) -> Void)) {
            ConnectionManager.instance.organisationRequestForAllUserAssetsByEmail(success: { response in
                let responseObj = response as? [String: Any]
                success(responseObj)
            }, failure: failure)
        }
        
    func organisationRequestForUploadAsset(success: @escaping ((_ responseObject: [String: Any]?) -> Void), failure: @escaping (( _ error: NSError?) -> Void)) {
            ConnectionManager.instance.organisationRequestForUploadAsset(success: { response in
                let responseObj = response as? [String: Any]
                success(responseObj)
            }, failure: failure)
        }
        
        func uploadAccessOfAssetToOrganisation(id: String, sharedWith: String, assetId: String, timePeriod: String, status: String, success: @escaping ((_ responseObject: Any?) -> Void), failure: @escaping ((_ error: NSError?) -> Void)) {
            ConnectionManager.instance.uploadAccessOfAssetToOrganisation(id: id, sharedWith: sharedWith, assetId: assetId, timePeriod: timePeriod, status: status, success: success, failure: failure)
        }
        
        func uploadAccessOfAllAssetByEmailToOrganisation(identifier: String,
                                                         status: String,
                                                         id: String,
                                                         timePeriod: String,
                                                         success: @escaping ((_ responseObject: AnyObject?) -> Void),
                                                         failure: @escaping ((_ error: NSError?) -> Void)) {
            ConnectionManager.instance.uploadAccessOfAllAssetByEmailToOrganisation(identifier: identifier, status: status, id: id, timePeriod: timePeriod, success: success, failure: failure)
        }
        
        func grantAccessOfUploadedAsset(identifier: String,
                                        assetType: String,
                                        status: String,
                                        id: String,
                                        success: @escaping ((_ responseObject: AnyObject?) -> Void),
                                        failure: @escaping ((_ error: NSError?) -> Void)) {
            ConnectionManager.instance.grantAccessOfUploadedAsset(identifier: identifier, assetType: assetType, status: status, id: id, success: success, failure: failure)
        }
    

}

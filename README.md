# df-Vault (DFVault SDK)

This SDK provide you storage and sharing features in miscellaneous aspects: <br>
    - Provided you the list of all your uploaded assets.<br>
    - Provide access of any assets to person/ organisation with email address and upto a time period.<br>
    - Show the list of assets those are shared to you. <br>
    - Show the list of shared asset by you. <br>
    - Provide you a list of access request(by any orgs or any person). which you can grant or deny.<br>
    
<b>You can achieve the functionality with easy integration of following steps:</b>

- In a new terminal window, run `pod install --repo-update` to install and update. Get [Cocoapods](https://cocoapods.org/)
*you can skip this case if you have updated pod in you mac.*

- Create the podfile in your project.
```
pod init
```

- Open the pod file from directory and add pods in podfile.
```
pod 'DFVault'
```

- Run command to install
```
pod install
```
<i> If any error occure in the process of `pod install` then try with `pod update` command.
<i> Now close the xcode project and open prj.xcworkspace instead. </i>


- Add your org's `VaultAccessToken`  token in your `Info.plist` file.
    ```
    <key>VaultAccessToken</key>
    <string>Enter your org&apos;s token</string>
    ```

- `import DFVault` in your `UIViewController` file where you want to use this feature.

- And instantiate the view with following code.

         // Open view with default configuration
        let vc = DFVault()
        vc.type = .organizationUploadAllAssetRequestList
        vc.userData = allAssetRequestData

        vc.initialize(success: { [weak self] viewController in
            DispatchQueue.main.async {
                if let vc = viewController {
                    self?.present(vc, animated: true, completion: nil)
                }
            }
            }, failure: { (error) in
                print(error?.userInfo ?? "Your api token is not valid")
        })
        vc.organizationRequestStatus = { assetData, status, datePeriod in
            print(assetData)
            print(status)
            print(datePeriod)
        }


Output would be:
<br>
<p align="left">
<img src="images/default/all_assets.png" width="200"/> 
<img src="images/default/share_email.png" width="200"/>
<img src="images/default/share_assets.png" width="200"/>
<img src="images/default/share_with_me.png" width="200"/>
<img src="images/default/detail.png" width="200"/>
  
<br>
<br>
<b>You can cutomize the color and theme of the SDK's view according to your projects user-experience.</b> 

<i>Just access the properties mentioned in the SDK. Have a look at the sample below:</i>

        let vc = DFVault()
        vc.type = .organizationUploadAllAssetRequestList
        vc.userData = allAssetRequestData
        vc.backgroundColor = #colorLiteral(red: 0.9137254902, green: 0.3921568627, blue: 0.3647058824, alpha: 1)
        vc.navigationBarColor = #colorLiteral(red: 0.4039215686, green: 0.7098039216, blue: 0.3647058824, alpha: 1)
        vc.navigationBarTintColor = UIColor.white
        vc.navigationTitleColor = UIColor.white
        vc.navigationTitle = "All asset"
        vc.initialize(success: { [weak self] viewController in
            DispatchQueue.main.async {
                if let vc = viewController {
                    self?.present(vc, animated: true, completion: nil)
                }
            }
            }, failure: { (error) in
                print(error?.userInfo ?? "Your api token is not valid")
        })
        vc.organizationRequestStatus = { assetData, status, datePeriod in
            print(assetData)
            print(status)
            print(datePeriod)
        }


Updated UI output would be:
<br>
<p align="left">
<img src="images/Confi/all_assets.png" width="200"/> 
<img src="images/Confi/share_email.png" width="200"/>
<img src="images/Confi/share_assets.png" width="200"/>
<img src="images/Confi/share_with_me.png" width="200"/>
<img src="images/Confi/detail.png" width="200"/>

<br>
  
<h2>Here are the list of all the configurable properties, you may need:</h2>

   // MARK: - Global properties.
    
    /** This property change the color of the title of the navigation bar. */
    public var navigationTitleColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    /** This property change the color of the navigation bar. */
    public var navigationBarColor: UIColor = UIColor.white
    
    /** This property chagne the text of the cancel button. */
    public var navigationCancelButtonText: String = "Cancel"
    
    /** This property change the navigation bar tint color of */
    public var navigationBarTintColor: UIColor = #colorLiteral(red: 0.1490196078, green: 0.5294117647, blue: 0.8745098039, alpha: 1)
    
    // MARK: - Share view controller properties.
    
    /** This property change the navigation title of */
    public var navigationTitle: String?
    
    /** This property change the background color of the controller. */
    public var backgroundColor: UIColor = #colorLiteral(red: 0.1490196078, green: 0.5294117647, blue: 0.8745098039, alpha: 1)
    
    /** This property change the button color in share view controller. */
    public var buttonColor: UIColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
    
    /** This property change the border width of the share view controller. */
    public var buttonBorderWidth: CGFloat = 0
    
    /** This property change the border color of share view controller. */
    public var buttonBorderColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    /** This property change the corner radius of the button in share view controller. */
    public var buttonCornerRadius: CGFloat = 5
    
    /** This property change the title of the button in share view controller. */
    public var buttonTitle: String = "SHARE"
    
    /** This property change the title of the button in share view controller. */
    public var buttonTitleColor: UIColor = #colorLiteral(red: 0.1490196078, green: 0.5294117647, blue: 0.8745098039, alpha: 1)
    
    /** This property change the text color of the share view controller. */
    public var textColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    /** This property change the corner radius of the text field and text views in share view controller. */
    public var textfieldCornerRadius: CGFloat = 5
    
    /** This property change the border width of the text field and text views in share view controller. */
    public var textfieldBorderWidth: CGFloat = 0.5
    
    /** This property change the border color of the text field and text views in share view controller. */
    public var textfieldBorderolor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    /** This property show the share with admin field in share controller. */
    public var adminEmail: String?
    
    // MARK: - TableCell configuration.
    
    /** This property change the background color of the cell */
    public var cellColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    /** This property change the color of heading of the cell. */
    public var cellHeadingColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    /** This property change the color of sub heading of the cell. */
    public var cellSubHeadingColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

    /** This property change the text color of the key. */
    public var keyColor: UIColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    
    /** This property change the text color of the value. */
    public var valueColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    // Properties for allow and grant the request.
    
    /** This property change the color of the grant access button.*/
    public var grantAccessColor: UIColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    
    /** This property change the color of the deny access button.*/
    public var denyAccessColor: UIColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
    
    /** This property change the title of the grant access button.*/
    public var grantAccessTitle: String = "Grant"
    
    /** This property change the color of the deny access button.*/
    public var denyAccessTitle: String = "Deny"
    
    /** This property change the color of revoke access button .*/
    public var revokeAccessColor: UIColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
    
    /** This property change the color of the edit button.*/
    public var editButtonColor: UIColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    
    /** This property change the title of the revoke access button.*/
    public var revokeAccessTitle: String = "Revoke access"
    
    /** This property change the color of the edit button.*/
    public var editAccessTitle: String = "Edit"
    
    /** This property change the color of the upload button. */
    public var uploadButtonColor: UIColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    
    /** This property change the title of the upload button. */
    public var uploadButtonTitle: String = "Upload"
    
    /** This property is enum type which you need to pass to open the controller accordingly. Default is .shareAsset */
    public var type: viewControllers = .shareAsset
    
    /** This property take the user data which user want to show on the screen of the framework. */
    public var userData = [String: Any]()
    
    /** These 3 property change the color of the grandiant view on all asset controller. */
    public var gradiantStartColor: UIColor = #colorLiteral(red: 0.1490196078, green: 0.5294117647, blue: 0.8745098039, alpha: 1)
    public var gradiantMidColor: UIColor = #colorLiteral(red: 0.1490196078, green: 0.5294117647, blue: 0.8745098039, alpha: 1)
    public var gradiantEndColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    public var leftBarImage: UIImage?


<br>
---

<br>
<b>More Details( Sample Code Repository):</b>

You can also take help from github repository including the working demo of  `DFVault`.

https://github.com/anandramdeo-df/df-Vault

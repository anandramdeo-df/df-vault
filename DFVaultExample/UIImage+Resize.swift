//
//  UIImage+Resize.swift
//  DFDocument
//
//  Created by Kritika on 11/12/18.
//  Copyright © 2018 Ranosys_ShubhamAgarwal. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    func resizeImageToUploadOnServer(maxSizeInKB: Int) -> Data {
        print("\(self.size)")
        
        let (imageSize, imageData) = self.logImageSizeInKB(scale: 1.0)
        if imageSize > maxSizeInKB {
            let resizedImage = self.reSizeImage()
            var scale: CGFloat = 1.0
            var (size, imageData) = resizedImage.logImageSizeInKB(scale: scale)
            while size > maxSizeInKB {
                scale -= 0.1
                if scale > 0 {
                    (size, imageData) = resizedImage.logImageSizeInKB(scale: scale)
                } else {
                    break
                }
            }
            return imageData
        }
        return imageData
    }
    
    func logImageSizeInKB(scale: CGFloat) -> (Int, Data) {
        
        if let data = self.jpegData(compressionQuality: scale) {
            
            let formatter = ByteCountFormatter()
            formatter.allowedUnits = ByteCountFormatter.Units.useKB
            formatter.countStyle = ByteCountFormatter.CountStyle.file
            let imageSize = formatter.string(fromByteCount: Int64(data.count))
            print("ImageSize(KB): \(imageSize)")
            
            return (Int(Int64(data.count) ), data)
        } else {
            return(0, Data())
        }
    }
    
    func reSizeImage() -> UIImage {
        var actualHeight = Float(self.size.height)
        var actualWidth = Float(self.size.width)
        let maxHeight: Float = 2000.0
        let maxWidth: Float = 2000.0
        var imgRatio: Float = actualWidth / actualHeight
        let maxRatio: Float = maxWidth / maxHeight
        let compressionQuality: CGFloat = 1.0
        if actualHeight > maxHeight || actualWidth > maxWidth {
            if imgRatio < maxRatio {
                //adjust width according to maxHeight
                imgRatio = maxHeight / actualHeight
                actualWidth = imgRatio * actualWidth
                actualHeight = maxHeight
            } else if imgRatio > maxRatio {
                //adjust height according to maxWidth
                imgRatio = maxWidth / actualWidth
                actualHeight = imgRatio * actualHeight
                actualWidth = maxWidth
            } else {
                actualHeight = maxHeight
                actualWidth = maxWidth
            }
        }
        let rect = CGRect(x: 0.0, y: 0.0, width: CGFloat(actualWidth), height: CGFloat(actualHeight))
        UIGraphicsBeginImageContext(rect.size)
        self.draw(in: rect)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()!
        let imageData: Data = img.jpegData(compressionQuality: compressionQuality)!
        UIGraphicsEndImageContext()
        
        return UIImage(data: imageData)!
    }}

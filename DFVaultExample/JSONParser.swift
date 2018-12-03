//
//  JSONParser.swift
//  DFVaultExample
//
//  Created by Kritika on 29/11/18.
//  Copyright © 2018 Ranosys_ShubhamAgarwal. All rights reserved.
//

import UIKit

extension UIViewController {
    func getJsondata(filename: String) -> [String: Any] {
        if let path = Bundle.main.path(forResource: filename, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let jsonResult = jsonResult as? [String: Any] {
                    return jsonResult
                }
            } catch (let error) {
                print(error)
                return [String: Any]()
            }
        }
        return [String: Any]()
    }
}

//
//  UtilityFunctions.swift
//  Cars
//
//  Created by Trevor McNeil on 2/13/22.
//  Copyright © 2022 Trevor-McNeil. All rights reserved.
//

import Foundation
import SwiftUI

let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

public func decodeJsonFileIntoArrayOfStructs<T: Decodable>(fullFilename: String, fileLocation: String, as type: T.Type = T.self) -> T {
    
    var jsonFileData: Data?
    var jsonFileUrl: URL?
    var arrayOfStructs: T?
    
    if fileLocation == "Main Bundle"{
        let urlOfJsonFileInMainBundle: URL? = Bundle.main.url(forResource: fullFilename, withExtension: nil)
        if let mainBundleUrl = urlOfJsonFileInMainBundle{
            jsonFileUrl = mainBundleUrl
        } else{
            print("JSON file \(fullFilename) does not exist in main bundle!")
        }
    } else{
        let urlOfJsonFileInDocumentDirectory: URL? = documentDirectory.appendingPathComponent(fullFilename)
        if let docDirectoryUrl = urlOfJsonFileInDocumentDirectory{
            jsonFileUrl = docDirectoryUrl
        } else{
            print("JSON file \(fullFilename) does not exist in document directory")
        }
    }
    do{
        jsonFileData = try Data(contentsOf: jsonFileUrl!)
    } catch{
        print("Undable to obtain JSON file \(fullFilename) content!")
    }
    
    do{
        let decoder = JSONDecoder()
        arrayOfStructs = try decoder.decode(T.self, from: jsonFileData!)
    } catch{
        print("Unable to decode JSON file \(fullFilename)!")
    }
    
    return arrayOfStructs!
}

//
//  CarData.swift
//  Cars
//
//  Created by Trevor McNeil on 2/13/22.
//  Copyright © 2022 Trevor-McNeil. All rights reserved.
//

import SwiftUI

var BrandStructList = [Brand]()
var ModelStructList = [Model]()

public func readDataFiles(){
    BrandStructList = decodeJsonFileIntoArrayOfStructs(fullFilename: "BrandsData.json", fileLocation: "Main Bundle")
    ModelStructList = decodeJsonFileIntoArrayOfStructs(fullFilename: "ModelsData.json", fileLocation: "Main Bundle")
    
}

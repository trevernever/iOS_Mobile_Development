//
//  ModelStruct.swift
//  Cars
//
//  Created by Trevor McNeil on 2/13/22.
//  Copyright © 2022 Trevor-McNeil. All rights reserved.
//

import SwiftUI

struct Model: Hashable, Codable, Identifiable{
    var id: Int
    var brandName: String
    var modelName: String
    var year: String
    var bodyStyle: String
    var startingMsrp: String
    var logoFilename: String
    var photoFilename: String
    var websiteUrl: String
    var driveType: String
    var engine: String
    var mpg: String
}

/*
 "id": 1,
 "brandName": "Acura",
 "modelName": "RDX",
 "year": "2022",
 "bodyStyle": "Premium Sport Crossover",
 "startingMsrp": "$40,100",
 "logoFilename": "acura",
 "photoFilename": "acura-rdx",
 "websiteUrl": "https://www.acura.com/",
 "driveType": "Front Wheel Drive",
 "engine": "2.0L 4cyl Turbo 10A",
 "mpg": "City 22 / Highway 28 / Combined 24"
 */

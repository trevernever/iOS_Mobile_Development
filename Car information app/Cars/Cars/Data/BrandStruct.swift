//
//  BrandStruct.swift
//  Cars
//
//  Created by Trevor McNeil on 2/13/22.
//  Copyright © 2022 Trevor-McNeil. All rights reserved.
//

import Foundation

struct Brand: Hashable, Codable, Identifiable{
    var id: Int
    var brandName: String
    var parentCompanyName: String
    var description: String
    var dateFounded: String
    var headquarters: String
    var logoFilename: String
    var websiteUrl: String
    var latitude: Double
    var longitude: Double
}

/*
 "id": 1,
 "brandName": "Acura",
 "parentCompanyName": "Honda Motor Company",
 "description": "Acura is the luxury and performance division of Japanese automaker Honda. The brand was launched in the United States and Canada on March 27, 1986, marketing luxury and performance automobiles. It was introduced to Hong Kong in 1991 (lasting until 2009), Mexico in 2004, China in 2006, Russia in 2014 (no longer available in Russia), Kuwait in 2015, and was also sold in Ukraine (until 2018).",
 "dateFounded": "27 March 1986",
 "headquarters": "Minato, Tokyo, Japan",
 "logoFilename": "acura",
 "websiteUrl": "https://www.acura.com/",
 "latitude": 35.686958,
 "longitude": 139.749466
 */

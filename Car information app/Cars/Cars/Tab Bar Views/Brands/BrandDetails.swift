//
//  BrandsList.swift
//  TravelGuide
//
//  Created by Trevor McNeil on 2/11/22.
//  Copyright © 2022 Trevor McNeil. All rights reserved.
//

import SwiftUI
import MapKit

struct BrandDetails: View {
    
    let brand: Brand
    
    @State private var selectedMapTypeIndex = 0
    var mapTypes = ["Standard", "Satellite", "Hybrid"]
    
    var body: some View {
        Form{
            Section(content: {Text(brand.brandName)}, header: {Text("Brand Name")})
            Section(content: {Text(brand.parentCompanyName)}, header: {Text("Parent Company Name")})
            Section(content:
                        {Image(brand.logoFilename)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(minWidth: 300, maxWidth: 500, alignment: .center)
                        },
                    header: {Text("Brand Logo")}
            ) // end of section
            Section(content: {Text(brand.description)}, header: {Text("Brand Description")})
            Section(content: {Text(brand.dateFounded)}, header: {Text("Date Founded")})
            Section(content: {Text(brand.headquarters)}, header: {Text("Company Headquarters")})
            Section(content:
                        {Link(destination: URL(string: brand.websiteUrl)!){
                            HStack{
                                Image(systemName: "globe").imageScale(.medium).font(Font.title.weight(.regular))
                                Text("Show Website").font(.system(size: 16))
                            }
                            .foregroundColor(.blue)
                        }},
                    header: {Text("Brand Website")}
            ) // end of section
            Section(content:
                        {Picker("Select Map Type", selection: $selectedMapTypeIndex){
                            ForEach(0..<mapTypes.count, id: \.self){ index in
                                Text(mapTypes[index]).tag(index)
                            }
                        }
                        .frame(minWidth: 300, maxWidth: 500, alignment: .center)
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal)
                        
                        NavigationLink(destination: brandLocationOnMap){
                            HStack{
                                Image(systemName: "mappin.and.ellipse")
                                    .imageScale(.medium)
                                    .font(Font.title.weight(.regular))
                                Text("Show Place Location on Map")
                                    .font(.system(size: 16))
                            }
                            .foregroundColor(.blue)
                        }
                        .frame(minWidth: 300, maxWidth: 500, alignment: .leading)
                        },
                    header: {Text("Select Map Type")}
            ) // end of section
            
        } //end of form
        .navigationTitle(Text("\(brand.brandName)"))
        .navigationBarTitleDisplayMode(.inline)
        .font(.system(size: 14))
    } // end of body
    
    var brandLocationOnMap: some View{
        var mapType: MKMapType
        switch selectedMapTypeIndex{
        case 0:
            mapType = MKMapType.standard
        case 1:
            mapType = MKMapType.satellite
        case 2:
            mapType = MKMapType.hybrid
        default:
            fatalError("Map type is out of range!")
        }
        return AnyView( MapView(mapType: mapType, latitude: brand.latitude, longitude: brand.longitude, delta: 10.0, deltaUnit: "degrees", annotationTitle: brand.brandName, annotationSubtitle: "")
                            .navigationTitle(Text("\(brand.headquarters)"))
                            .navigationBarTitleDisplayMode(.inline)
                            .edgesIgnoringSafeArea(.all) )
    }
}

struct BrandDetails_Previews: PreviewProvider {
    static var previews: some View {
        BrandDetails(brand: BrandStructList[0])
    }
}

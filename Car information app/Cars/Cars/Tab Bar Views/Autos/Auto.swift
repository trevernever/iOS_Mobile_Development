//
//  Auto.swift
//  TravelGuide
//
//  Created by Trevor McNeil on 2/11/22.
//  Copyright © 2022 Trevor McNeil. All rights reserved.
//

import SwiftUI

struct Auto: View {
    
    @State private var selectedBrand = BrandStructList[0]
    var body: some View {
        VStack {
            Text("Automobiles")
                .font(.headline)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    
                    ForEach(BrandStructList) { brand in
                   
                        Button(action: {
                            selectedBrand = brand
                        }) {
                            VStack {
                                Image(brand.logoFilename)
                                    .renderingMode(.original)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 60.0)
                                Text(brand.brandName)
                                    .fixedSize()
                                    .foregroundColor(brand == selectedBrand ? .red : .blue)
                            }
                        }   // End of Button
                       
                    }   // End of ForEach
                   
                }   // End of HStack
                .font(.system(size: 14))
               
            }   // End of ScrollView
            
            Divider()
            BrandDetails(brand: selectedBrand)
           
        }   // End of VStack
    }
}

struct Auto_Previews: PreviewProvider {
    static var previews: some View {
        Auto()
    }
}

//
//  BrandsList.swift
//  TravelGuide
//
//  Created by Trevor McNeil on 2/11/22.
//  Copyright © 2022 Trevor McNeil. All rights reserved.
//

import SwiftUI

struct BrandItem: View {
    
    let brand: Brand
    
    var body: some View {
        HStack{
            Image(brand.logoFilename)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100.0)
            
            VStack(alignment: .leading){
                Text(brand.brandName)
                Text(brand.parentCompanyName)
                Text(brand.headquarters)
            } //end of VStack
            .font(.system(size: 14))
        } // end of HStack
    }
}

struct BrandItem_Previews: PreviewProvider {
    static var previews: some View {
        BrandItem(brand: BrandStructList[0])
    }
}

//
//  BrandsList.swift
//  TravelGuide
//
//  Created by Trevor McNeil on 2/11/22.
//  Copyright © 2022 Trevor McNeil. All rights reserved.
//

import SwiftUI

struct ModelItem: View {

	var model: Model

    var body: some View {
		HStack{
			Image(model.logoFilename)
				.resizable()
				.aspectRatio(contentMode: .fit)
                .frame(width: 100.0)
				
			VStack(alignment: .leading){
				Text(model.brandName)
				Text(model.modelName)
				Text(model.bodyStyle)
			}// end of VStack
			.font(.system(size: 14))
		}//end of HStack
    }
}

struct ModelItem_Previews: PreviewProvider {
    static var previews: some View {
        ModelItem(model: ModelStructList[0])
    }
}

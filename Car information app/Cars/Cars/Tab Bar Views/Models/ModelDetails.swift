//
//  BrandsList.swift
//  TravelGuide
//
//  Created by Trevor McNeil on 2/11/22.
//  Copyright © 2022 Trevor McNeil. All rights reserved.
//

import SwiftUI

struct ModelDetails: View {

	var model: Model

    var body: some View {
        Form{
			Section(content: 
						{HStack{
							Image(model.logoFilename)
								.resizable()
								.aspectRatio(contentMode: .fit)
								.frame(width: 100.0)
								
							Text(model.brandName)
						}},
					header: {Text("Brand Name")})
			Section(content: {Text(model.modelName)}, header: {Text("Model Name")})
			Section(content:
                        {Image(model.photoFilename)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(minWidth: 300, maxWidth: 500, alignment: .center)
                        },
                    header: {Text("Model Photo")})
			Section(content: {Text(model.year)}, header: {Text("Model Year")})
			Section(content: {Text(model.bodyStyle)}, header: {Text("Model Body Style")})
			Section(content: {Text(model.startingMsrp)}, header: {Text("Starting Msrp")})
			Section(content:
                        {Link(destination: URL(string: model.websiteUrl)!){
                            HStack{
                                Image(systemName: "globe")
                                    .imageScale(.medium)
                                    .font(Font.title.weight(.regular))
                                Text("Show Website").font(.system(size: 16))
                            }
                            .foregroundColor(.blue)
                        }},
                    header: {Text("Brand Website")}
            ) // end of section
			Section(content: {Text(model.driveType)}, header: {Text("Drive Type")})
			Section(content: {Text(model.engine)}, header: {Text("Engine")})
			Section(content: {Text(model.mpg)}, header: {Text("Miles Per Gallong (MPG)")})
		}
    }
}

struct ModelDetails_Previews: PreviewProvider {
    static var previews: some View {
        ModelDetails(model: ModelStructList[0])
    }
}

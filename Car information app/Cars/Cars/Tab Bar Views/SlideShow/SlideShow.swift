//
//  SlideShow.swift
//  TravelGuide
//
//  Created by Trevor McNeil on 2/11/22.
//  Copyright © 2022 Trevor McNeil. All rights reserved.
//

import SwiftUI

struct SlideShow: View {
    var body: some View {
        NavigationView {
            TabView {
                ForEach(ModelStructList) { model in
                    VStack {
                        Link(destination: URL(string: model.websiteUrl)!) {
                            Text("\(model.brandName) \(model.modelName)")
                                .font(.headline)
                                .foregroundColor(.blue)
                                .padding()
                        }
                        Image(model.photoFilename)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
            }   // End of TabView
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .navigationTitle("Car Models")
				.navigationBarTitleDisplayMode(.inline)
        }   // End of NavigationView
            // Use single column navigation view for iPhone and iPad
            .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SlideShow_Previews: PreviewProvider {
    static var previews: some View {
        SlideShow()
    }
}

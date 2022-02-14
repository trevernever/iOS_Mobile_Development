//
//  BrandList.swift
//  TravelGuide
//
//  Created by Trevor McNeil on 2/11/22.
//  Copyright © 2022 Trevor McNeil. All rights reserved.
//

import SwiftUI

struct BrandList: View {
    
    @State private var showSourceReferenceAlert = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(BrandStructList){ aBrand in
                    NavigationLink(destination: BrandDetails(brand: aBrand)){
                        BrandItem(brand: aBrand)
                    }
                }
            } //end of list
            .navigationTitle("Car Brands")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing){
                    
                    Button(action: {
                        showSourceReferenceAlert = true;
                    }) {
                        Image(systemName: "info.circle")
                            .imageScale(.small)
                            .font(Font.title.weight(.light))
                    }
                }//end of tool bar item
            }//end of toolbar
            .alert(isPresented: $showSourceReferenceAlert, content: { sourceReferenceAlert })
        } // end of navigation
        .customNavigationViewStyle()
    } // end of body
    
    var sourceReferenceAlert: Alert{
        Alert(title: Text("Source Reference"), message: Text("Car brands data are taken from: https://en.wikipedia.org/wiki/List_of_automobile_manufacturers"), dismissButton: .default(Text("OK")) )
    }
}

struct BrandList_Previews: PreviewProvider {
    static var previews: some View {
        BrandList()
    }
}

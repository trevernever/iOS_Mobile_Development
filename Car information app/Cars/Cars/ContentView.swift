//
//  ContentView.swift
//  TravelGuide
//
//  Created by Trevor McNeil on 2/11/22.
//  Copyright © 2022 Trevor McNeil. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
			BrandList()
				.tabItem(){
					Image(systemName: "list.bullet")
					Text("Brands")
				}
			ModelList()
				.tabItem(){
					Image(systemName: "list.bullet.rectangle")
					Text("Models")
				}
			Auto()
				.tabItem(){
					Image(systemName: "car.2")
					Text("Autos")
				}
			CarLoanCalculator()
				.tabItem(){
					Image(systemName: "dollarsign.square")
					Text("Loan Calculator")
				}
			SlideShow()
				.tabItem(){
					Image(systemName: "rectangle.on.rectangle")
					Text("Slide Show")
				}
		}   // End of TabView
        .font(.headline)
        .imageScale(.medium)
        .font(Font.title.weight(.regular))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

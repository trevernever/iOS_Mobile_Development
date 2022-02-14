//
//  ModelList.swift
//  TravelGuide
//
//  Created by Trevor McNeil on 2/11/22.
//  Copyright © 2022 Trevor McNeil. All rights reserved.
//

import SwiftUI

struct ModelList: View {
    var body: some View {
        NavigationView{
			List{
				ForEach(ModelStructList){ aModel in
					NavigationLink(destination: ModelDetails(model: aModel)){
						ModelItem(model: aModel)
					}
				}
			}// end of list
			.navigationTitle("Car Models")
			.navigationBarTitleDisplayMode(.inline)
		}//end of naviigation view
		.customNavigationViewStyle()
    }// end of body	
}

struct ModelList_Previews: PreviewProvider {
    static var previews: some View {
        ModelList()
    }
}

//
//  ContentDetail.swift
//  JsonParsingTest
//
//  Created by YOUNGSIC KIM on 2019-12-24.
//  Copyright © 2019 YOUNGSIC KIM. All rights reserved.
//

import SwiftUI

struct ContentDetail: View {
    var simpleData: Simple
    var body: some View {
        VStack(alignment: .leading) {
            ProfileImageView(withURL: simpleData.userImage.large)
            
            // User Profile Views
            ProfileInfoView(isTitle: true,imageSystemName: "person.crop.circle", titleName: "User Profile ")
            ProfileInfoView(imageSystemName: "person.crop.square", titleName: "User ID: ", value: simpleData.name)
            ProfileInfoView(imageSystemName: "a.circle", titleName: "Age: ", value: String(simpleData.age))
            ProfileInfoView(imageSystemName: "envelope.fill", titleName: "Email: ", value: simpleData.email)
            
            // User Location Views
            
            ProfileInfoView(isTitle: true,imageSystemName: "mappin.circle", titleName: "User Location")
            
            ProfileInfoView(imageSystemName: "pin.fill", titleName: "Location: ", value: simpleData.location)
            MapView(coordinate: simpleData.locationCoordinate)
        }
    }
}

struct ContentDetail_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetail(simpleData: simpleDataList[0])
    }
}


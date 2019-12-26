//
//  ProfileInfo.swift
//  JsonParsingTest
//
//  Created by YOUNGSIC KIM on 2019-12-25.
//  Copyright © 2019 YOUNGSIC KIM. All rights reserved.
//

import SwiftUI

struct ProfileInfoView: View {
    var isTitle = false
    var imageSystemName: String
    var titleName: String
    var value: String?
    
    var frameSize: CGFloat { return isTitle ? 30 : 20 }
    var leadingPadding: CGFloat { return isTitle ? 10 : 20 }
    var font: Font { return isTitle ? Font.title : Font.headline }
    
    var body: some View {
        HStack {
            Image(systemName: imageSystemName)
            .resizable()
            .frame(width: frameSize, height: frameSize)
            .padding(.leading, leadingPadding)
            Text(titleName)
                .font(font).bold()
            if !isTitle {
                Text(value!)
                .font(.body)
            }
        }
    }
}

struct ProfileInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoView(isTitle: false,imageSystemName: "person.crop.square", titleName: "Name: ", value: "User Name").previewLayout(PreviewLayout.fixed(width: 300, height: 50))
    }
}

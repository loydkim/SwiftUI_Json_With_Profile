//
//  ProfileImageView.swift
//  JsonParsingTest
//
//  Created by YOUNGSIC KIM on 2019-12-25.
//  Copyright © 2019 YOUNGSIC KIM. All rights reserved.
//

import SwiftUI

struct ProfileImageView: View {
    @ObservedObject var imageLoader:DataLoader
    @State var image:UIImage = UIImage()
    
    init(withURL url:String) {
        imageLoader = DataLoader(urlString:url)
    }
    
    var body: some View {
        VStack {
            Image(uiImage: image)
            .resizable()
            .edgesIgnoringSafeArea(.top)
            .frame(height: 140)
            .blur(radius: 10, opaque: true)
            HStack {
                Spacer()
                Image(uiImage: image)
                .resizable()
                    .frame(width:120,height: 120)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 3))
                .shadow(radius: 10)
                Spacer()
            }.offset(x: 0, y: -140)
            .padding(.bottom, -140)
        }.onReceive(imageLoader.didChange) { data in
            self.image = UIImage(data: data) ?? UIImage()
        }
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView(withURL: "https://randomuser.me/api/portraits/med/women/10.jpg")
    }
}

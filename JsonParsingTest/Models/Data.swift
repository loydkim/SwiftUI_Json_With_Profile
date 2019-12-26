//
//  Data.swift
//  JsonParsingTest
//
//  Created by YOUNGSIC KIM on 2019-12-20.
//  Copyright © 2019 YOUNGSIC KIM. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

let urlString = "http://api.randomuser.me/"

func userDataToView(data:Data) -> Simple {
    var addData = simpleDataList[0]
    do {
        // JSON Data to NSDictionary
        let json = try JSONSerialization.jsonObject(with: data) as! NSDictionary
        // Get the result array
        if let resultsArray = json.object(forKey: "results") as? NSArray {
            let resultDictionary: NSDictionary = resultsArray[0] as! NSDictionary
            let loginDictionary: NSDictionary = resultDictionary["login"] as! NSDictionary
            let pictureDictionary: NSDictionary = resultDictionary["picture"] as! NSDictionary
            let dobDictionary: NSDictionary = resultDictionary["dob"] as! NSDictionary
            let locationDictionary: NSDictionary = resultDictionary["location"] as! NSDictionary
            let coordinatesDictionary: NSDictionary = locationDictionary["coordinates"] as! NSDictionary
            
            
            // Values from JSon data
            let username = (loginDictionary["username"] ?? "Username") as! String
            let email = (resultDictionary["email"] ?? "email") as! String
            let age = (dobDictionary["age"] ?? 55) as! Int
            
            let thumbnail = (pictureDictionary["thumbnail"] ?? "thumbnail") as! String
            let large = (pictureDictionary["large"] ?? "large") as! String
            
            let city = (locationDictionary["city"] ?? "city") as! String
            let country = (locationDictionary["country"] ?? "country") as! String
            
            let longitude = Double((coordinatesDictionary["longitude"] ?? "11") as! String)!
            let latitude = Double((coordinatesDictionary["latitude"] ?? "11") as! String)!
            
            // Now we can get a value from dictionary
            addData.id = age
            addData.name = username
            addData.email = email
            addData.age = age
            
            let pictures = Picture(large: large, thumbnail: thumbnail)
            addData.userImage = pictures
            
            addData.location = city + ", " + country
            let coordinates = Coordinates(latitude: latitude, longitude: longitude)
            addData.coordinates = coordinates
            
        }
    } catch {
        fatalError("Couldn't get data error is \(error) ")
    }
    
    return addData
}

struct ImageView: View {
    @ObservedObject var imageLoader:DataLoader
    @State var image:UIImage = UIImage()

    init(withURL url:String) {
        imageLoader = DataLoader(urlString:url)
    }

    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:50, height:50)
        }.onReceive(imageLoader.didChange) { data in
            self.image = UIImage(data: data) ?? UIImage()
        }
    }
}

class DataLoader: ObservableObject {
    @Published var didChange = PassthroughSubject<Data, Never>()
    @Published var data = Data() {
        didSet {
            didChange.send(data)
        }
    }

    init(urlString:String) {
        getDataFromURL(urlString: urlString)
    }
    
    func getDataFromURL(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
}


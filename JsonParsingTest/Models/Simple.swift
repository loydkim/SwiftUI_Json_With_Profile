//
//  Simple.swift
//  JsonParsingTest
//
//  Created by YOUNGSIC KIM on 2019-12-20.
//  Copyright © 2019 YOUNGSIC KIM. All rights reserved.
//

import Foundation
import CoreLocation

struct Simple: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var email: String
    var phone: String
    var age: Int
    var location: String
    var userImage: Picture
    var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
}

let simpleDataList = [
    Simple(id: 0,name: "name1", email: "email1", phone: "phone1", age: 33, location: "location1", userImage: Picture(large:"https://randomuser.me/api/portraits/med/women/70.jpg",thumbnail:"https://randomuser.me/api/portraits/med/women/70.jpg"), coordinates: Coordinates(latitude:40.718373,longitude:-73.994185))
]

struct Picture: Hashable,Codable {
    var large: String
    var thumbnail: String
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

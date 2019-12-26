//
//  MapView.swift
//  JsonParsingTest
//
//  Created by YOUNGSIC KIM on 2019-12-24.
//  Copyright © 2019 YOUNGSIC KIM. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D
    var deltaValue: Double = 0.02
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: deltaValue, longitudeDelta: deltaValue)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: simpleDataList[0].locationCoordinate)
    }
}

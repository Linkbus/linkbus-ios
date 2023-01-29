//
//  RouteSheet.swift
//  Linkbus
//
//  Created by Michael Carroll on 8/25/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI
import MapKit

//struct MapView: UIViewRepresentable {
//    func makeUIView(context: Context) -> MKMapView {
//        MKMapView(frame: .zero)
//    }
//
//    func updateUIView(_ view: MKMapView, context: Context) {
//        let coordinate = CLLocationCoordinate2D(
//            latitude: 34.011286, longitude: -116.166868)
//        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
//        let region = MKCoordinateRegion(center: coordinate, span: span)
//        view.setRegion(region, animated: true)
//    }
//}

struct RouteSheet: View {
    @Environment(\.presentationMode) var presentationMode
    var route: LbRoute!
    
    @State private var totalHeight
        //      = CGFloat.zero       // << variant for ScrollView/List
        = CGFloat.infinity   // << variant for VStack
    
    @ObservedObject var routeController: RouteController
//    var coord: CLLocationCoordinate2D
    
    init(route:LbRoute, routeController: RouteController) {
        self.route = route
        //UIScrollView.appearance().bounces = false
        
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().tintColor = .clear
        UINavigationBar.appearance().backgroundColor = .clear
        
        self.routeController = routeController

//        self.coord = CLLocationCoordinate2D(latitude: 45.5606, longitude: -94.3221)
    }
    
    var body: some View {
//        NavigationView {
            VStack() {
                RoundedRectangle(cornerRadius: CGFloat(5.0) / 2.0)
                    .frame(width: 60, height: 4)
                    .foregroundColor(Color(UIColor.systemGray2))
                    .padding([.top], 10)
                    .padding([.bottom], 5)
                
//                VStack {
                    
                    VStack(alignment: .leading) {
                        
                        //                        RouteCard(title: route.title, description: route.originLocation, image: Image("Smoothie_Bowl"), price: 15.00, peopleCount: 2, ingredientCount: 2, category: "5 minutes", route: route, routeController: self.routeController, buttonHandler: nil)
                        //                            .transition(.scale)
                        //                            .animation(.easeInOut)
                        
                        // origin
                        HStack(alignment: .firstTextBaseline) {
                            Image(uiImage: UIImage(systemName: "smallcircle.fill.circle")!) //stop.circle.fill looks ok
                                .renderingMode(.template)
                                //.foregroundColor(Color(red: 43/255, green: 175/255, blue: 187/255))
                                .foregroundColor(Color.blue)
                                //.font(.subheadline) //weight: .ultralight))
                                .font(.system(size: 25))
                                .padding(.leading)
                            
                            
                            Text(route.origin)
                                .font(.system(size: 25))
                                .padding(.leading)
                            
                            Spacer()
                        }
                        .padding([.top], 5)
                        
                        //origin location
                        HStack(alignment: .firstTextBaseline) {
                            //dash indent?
                            //                    Image(uiImage: UIImage(systemName: "smallcircle.fill.circle")!)//systemName: "smallcircle.fill.circle") //stop.circle.fill looks ok
                            //                        .font(.headline)
                            //                        .padding(.leading)
                            Text("Pickup from " + route.originLocation)
                                .font(.system(size: 14))
                                .padding(.leading, 45) //fix
                                .padding(.leading)
                                .foregroundColor(Color.gray)
                            Spacer()
                        }
                        .padding([.bottom], 5)
                        
                        // ellipses
                        HStack(alignment: .firstTextBaseline) {
                            Image(systemName: "ellipsis")
                                .rotationEffect(.degrees(90.0))
                                .font(.system(size: 20))
                                .padding(.leading)
                                .foregroundColor(Color.gray)
                        }
                        .padding([.top, .bottom], 5)
                        
                        // destination
                        HStack(alignment: .firstTextBaseline) {
                            Image(uiImage: UIImage(systemName: "mappin.circle.fill")!)
                                .renderingMode(.template)
                                //.foregroundColor(Color(red: 43/255, green: 175/255, blue: 187/255))
                                .foregroundColor(Color.blue)
                                //.font(.headline)
                                .font(.system(size: 25))
                                .padding(.leading)
                            Text(route.destination)
                                //.font(.title)
                                .font(.system(size: 25))
                                .padding(.leading)
                            Spacer()
                        }
                        .padding([.top], 5)
                        
                        //destination location
                        HStack(alignment: .lastTextBaseline) {
                            //                    Image(uiImage: UIImage(systemName: "smallcircle.fill.circle")!)//systemName: "smallcircle.fill.circle") //stop.circle.fill looks ok
                            //                        .font(.headline)
                            //                        .padding(.leading)
                            Text("Dropoff at " + route.destinationLocation)
                                //.font(.subheadline)
                                .font(.system(size: 14))
                                .padding(.leading, 45) //fix
                                .padding(.leading)
                                .foregroundColor(Color.gray)
                            Spacer()
                        }
                        
                    }
                    .padding(12)
                    
                    
    
                        
                    
                    
//                    VStack(alignment: .leading) {
//                        Divider().foregroundColor(Color.green)//.background(Color(UIColor.systemGray2))
//                        ForEach(route.times, id: \.self) { time in
//
//                            Text(time.timeString)
//                                .font(Font.custom("HelveticaNeue", size: 16))
////                                .padding([.leading], 6)
//
////                            Spacer()
//                            Divider().background(Color(UIColor.systemGray2))
//
//                        }
//                    }
//                    .transition(.slide)
//                    .padding([.leading, .trailing], 26)
//                    .padding([.top], 5)
                    
                    
                    
                    
                    
                        // route times
//                        HStack(alignment: .lastTextBaseline) {
//                            VStack(alignment: .leading, spacing: 0) {
//                                ForEach(route.times, id: \.self) { time in
//                                    HStack {
//                                        if (route.nextBusTimer == "Departing now" && time.current) {
//                                            Text(time.timeString)
//                                                .font(Font.custom("HelveticaNeue", size: 12))
//                                                .padding([.leading, .trailing], 10)
//                                                .padding([.top, .bottom], 5)
//                                                .foregroundColor(Color.white)
//                                                //.background(Color(red: 43/255, green: 175/255, blue: 187/255))
//                                                .background(Color.red)
//                                                .cornerRadius(7)
//                                                .padding([.bottom], 5)
//                                        }
//                                        else if (route.nextBusTimer.contains("Now") && time.current) {
//                                            Text(time.timeString)
//                                                .font(Font.custom("HelveticaNeue", size: 12))
//                                                .padding([.leading, .trailing], 10)
//                                                .padding([.top, .bottom], 5)
//                                                .foregroundColor(Color.white)
//                                                //.background(Color(red: 43/255, green: 175/255, blue: 187/255))
//                                                .background(Color.green)
//                                                .cornerRadius(7)
//                                                .padding([.bottom], 5)
//                                        }
//                                        else if (routeController.localizedDescription == "The Internet connection appears to be offline.") ||
//                                                    (routeController.csbsjuApiOnlineStatus == "CsbsjuApi invalid response") {
//                                            Text(time.timeString)
//                                                .font(Font.custom("HelveticaNeue", size: 12))
//                                                .padding([.leading, .trailing], 10)
//                                                .padding([.top, .bottom], 5)
//                                                .foregroundColor(Color.white)
//                                                //.background(Color(red: 43/255, green: 175/255, blue: 187/255))
//                                                .background(Color.gray)
//                                                .cornerRadius(7)
//                                                .padding([.bottom], 5)
//                                        }
//                                        else {
//                                            Text(time.timeString)
//                                                .font(Font.custom("HelveticaNeue", size: 16))
////                                                .padding([.leading, .trailing], 10)
////                                                .padding([.top, .bottom], 5)
////                                                .foregroundColor(Color.white)
////                                                //.background(Color(red: 43/255, green: 175/255, blue: 187/255))
////                                                .background(Color.blue)
////                                                .cornerRadius(7)
////                                                .padding([.bottom], 5)
//                                        }
//                                        Spacer()
//
//                                    }
//                                    Divider().background(Color.gray)
//                                }
////                                Button(action: { }, label: {
////                                    Text("View tomorrow's schedule")
////                                        .foregroundColor(.white)
////                                        .padding(12)
////                                        .font(Font.custom("HelveticaNeue", size: 14))
////                                        .frame(alignment: .leading)
////                                        .background(Color.green)
////                                        .cornerRadius(15)
////                                })
//                            }
//                            .buttonStyle(PlainButtonStyle())
//                            .padding(12)
//                            .padding(.leading)
//                        }
//                        .padding(.leading)
//                        .padding([.bottom], 5)
//                        .transition(.opacity)
                        
                        
                        
//                    }
//                    .transition(.slide)
//                    MapView(coordinate: self.coord).edgesIgnoringSafeArea(.all)
//                }
//                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
//                .navigationBarTitle("", displayMode: .inline)
//                .navigationBarHidden(true)
                
                
                
                
                
//                VStack(alignment: .leading) {
                    ZStack {

                        MapView(route: self.route)
                            .edgesIgnoringSafeArea(.all)

                        HStack(alignment: .top) {
                            VStack {
                                Text("Pickup Times")
                                    .font(Font.custom("HelveticaNeue", size: 16))
                                    .foregroundColor(Color.blue)
                                    .bold()
//                                    .shadow(color: Color.white, radius: 1, x: 1, y: 1)

                                ScrollView(showsIndicators: false) {
                                    ForEach(route.times, id: \.self) { time in
                                        Text(time.timeString)
                                            .font(Font.custom("HelveticaNeue", size: 16))
                                            .padding([.leading, .trailing], 10)
                                            .padding([.top, .bottom], 5)
                                            .foregroundColor(Color(red: 0.23, green: 0.23, blue:0.23))
                                            .background(Color.white)
                                            .cornerRadius(7)
                                            .padding([.bottom], 4)
//                                            .shadow(color: Color.black, radius: 1, x: 0, y: 1)
                                    }
                                    .padding([.leading, .trailing], 12)
                                }
                            }
//                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            Spacer()
                        }
                        .padding([.top, .bottom], 15)
                            
                            
                            // .background(Color.green)
                    }
                
//                    }.background(Color.red)
//                }.background(Color.yellow)
                
                
                
                
                
                
                
//                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
//
//            }
//            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
//            Spacer()
            
            
            

            
            //.background(Color(UIColor.systemGroupedBackground)).edgesIgnoringSafeArea(.all)
            }
//            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        
//                        .navigationBarTitle("", displayMode: .inline)
//                        .navigationBarHidden(true)
//        Spacer()
    }
    
}



struct RouteSheet_Previews: PreviewProvider {
    static var previews: some View {
        RouteSheet(route: LbRoute(id: 0, title: "Gorecki to Sexton", times: [LbTime](), nextBusTimer: "5 minutes", origin: "Gorecki", originLocation: "Gorecki Center, CSB", destination: "Sexton", destinationLocation: "Sexton Commons, SJU", city: "Collegeville", state: "Minnesota", coordinates: Coordinates(longitude: 0, latitude: 0)), routeController: RouteController())
    }
}


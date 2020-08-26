//
//  ProductCard.swift
//  FoodProductCard
//
//  Created by Jean-Marc Boullianne on 11/17/19.
//  Copyright © 2019 Jean-Marc Boullianne. All rights reserved.
//
import SwiftUI

struct ProductCard: View {
    
    @State var showRouteSheet = false
    
    var image:Image     // Featured Image
    var price:Double    // USD
    var title:String    // Product Title
    var description:String // Product Description
    var ingredientCount:Int // # of Ingredients
    var peopleCount:Int     // Servings
    var category:String?    // Optional Category
    var buttonHandler: (()->())?
    
    var route: LbRoute!
    
    @State private var totalHeight
    //      = CGFloat.zero       // << variant for ScrollView/List
        = CGFloat.infinity   // << variant for VStack
    
    //var landmark: Landmark
    
    init(title:String, description:String, image:Image, price:Double, peopleCount:Int, ingredientCount:Int, category:String?, route:LbRoute, buttonHandler: (()->())?) {
        
        self.title = title
        self.description = description
        self.image = image
        self.price = price
        self.peopleCount = peopleCount
        self.ingredientCount = ingredientCount
        self.category = category
        self.buttonHandler = buttonHandler
        self.route = route
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            // Main Featured Image - Upper Half of Card
            MapView(coordinate: route.locationCoordinate)
                .scaledToFill()
                .frame(minWidth: nil, idealWidth: nil, maxWidth: UIScreen.main.bounds.width, minHeight: nil, idealHeight: nil, maxHeight: 300, alignment: .center)
                .clipped()
                
                .overlay(
                    Text("Face Mask Required")
                        .fontWeight(Font.Weight.medium)
                        .font(Font.system(size: 16))
                        .foregroundColor(Color.white)
                        .padding([.leading, .trailing], 16)
                        .padding([.top, .bottom], 8)
                        .background(Color.black.opacity(0.5))
                        .mask(RoundedCorners(tl: 0, tr: 0, bl: 0, br: 15))
                    , alignment: .topLeading)
            
            // Stack bottom half of card
            VStack(alignment: .leading, spacing: 6) {
                Text(self.title)
                    .fontWeight(Font.Weight.heavy)
                Text(self.description)
                    .font(Font.custom("HelveticaNeue-Bold", size: 16))
                    .foregroundColor(Color.gray)
                
                // Horizontal Line separating details and price
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.3))
                    .frame(width: nil, height: 1, alignment: .center)
                    .padding([.leading, .trailing], -12)
                
                // 'Based on:' Horizontal Category Stack
                HStack(alignment: .center, spacing: 6) {
                    
                    if category != nil {
                        Text("Next bus:")
                            .font(Font.system(size: 13))
                            .fontWeight(Font.Weight.heavy)
                        HStack {
                            Text(category!)
                                .font(Font.custom("HelveticaNeue-Medium", size: 12))
                                .padding([.leading, .trailing], 10)
                                .padding([.top, .bottom], 5)
                                .foregroundColor(Color.white)
                        }
                        .background(Color(red: 43/255, green: 175/255, blue: 187/255))
                        .cornerRadius(7)
                        Spacer()
                    }
                    
                    HStack(alignment: .center, spacing: 0) {
                        Text("")
                            .foregroundColor(Color.gray)
                        Text("\(self.ingredientCount)")
                    }.font(Font.custom("HelveticaNeue", size: 14))
                    
                    
                }
                .frame(maxHeight: totalHeight) // << variant for VStack
                .padding([.top, .bottom], 8)
                
                
            }
            .padding(12)
            
            
            
        }
        
            //https://medium.com/@masamichiueta/bridging-uicolor-system-color-to-swiftui-color-ef98f6e21206
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
        .onTapGesture {
            self.showRouteSheet = true
        }.sheet(isPresented: $showRouteSheet) {
            RouteSheet(route: self.route)
        }
        
    }
    



struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(title: "Gorecki to Sexton", description: "Gorecki Center", image: Image("Smoothie_Bowl"), price: 15.00, peopleCount: 2, ingredientCount: 2, category: "5 minutes", route: LbRoute(id: 0, title: "Test", times: [LbTime](), origin: "Gorecki", originLocation: "Gorecki Center, CSB", destination: "Sexton", destinationLocation: "Sexton Commons, SJU", city: "Collegeville", state: "Minnesota", coordinates: Coordinates(longitude: 0, latitude: 0)), buttonHandler: nil)
    }
}

struct RoundedCorners: Shape {
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let w = rect.size.width
        let h = rect.size.height
        
        let tr = min(min(self.tr, h/2), w/2)
        let tl = min(min(self.tl, h/2), w/2)
        let bl = min(min(self.bl, h/2), w/2)
        let br = min(min(self.br, h/2), w/2)
        
        path.move(to: CGPoint(x: w / 2.0, y: 0))
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr,
                    startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        
        path.addLine(to: CGPoint(x: w, y: h - br))
        path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br,
                    startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        
        path.addLine(to: CGPoint(x: bl, y: h))
        path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl,
                    startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        
        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(center: CGPoint(x: tl, y: tl), radius: tl,
                    startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        
        return path
    }
}
}

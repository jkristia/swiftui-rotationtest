//
//  ContentView.swift
//  positionTest
//
//  Created by jesper kristiansen on 1/27/20.
//  Copyright © 2020 jesper kristiansen. All rights reserved.
//

import SwiftUI

extension Color {
    static func rgb(_ r: Int, _ g: Int, _ b: Int) -> Color {
        let f255 = Double(255)
        return Color(
            red: Double(r)/f255,
            green: Double(g)/f255,
            blue: Double(b)/f255)
    }
}

struct ContentView: View {
    @EnvironmentObject var device: Device
    static var renderCount: Int = 0;

    var body: some View {
        let orientation = device.isPortrait ? "Portrait" : "Landscape"
        ContentView.renderCount += 1
        return ZStack (alignment: .center) {
            Color.rgb(129, 236, 236)
            ZStack (alignment: .topLeading) {
                GeometryReader { geometry in
                    PanelView(size: geometry.size)
                }
            }
            .padding(40)
            HStack {
                Spacer()
                VStack {
                    Text(orientation)
                    .font(.system(size: 26))
                    Text("Redraw count \(ContentView.renderCount)")
                        .font(.system(size: 18))
                }
                Spacer()
            }
        }
    }
}
struct PanelView: View {
    let size: CGSize
    var body: some View {
        return ZStack (alignment: .topLeading) {
            Color.rgb(255, 234, 167)
            CircleView(offset: CGPoint(x: 0, y: 0), radius: 10)
            CircleView(offset: CGPoint(x: size.width, y: 0), radius: 15)
            CircleView(offset: CGPoint(x: 0, y: size.height), radius: 20)
            CircleView(offset: CGPoint(x: size.width, y: size.height), radius: 25)

            PointLabel(offset: CGPoint(x: 0, y: 0))
            PointLabel(offset: CGPoint(x: size.width, y: 0))
            PointLabel(offset: CGPoint(x: 0, y: size.height))
            PointLabel(offset: CGPoint(x: size.width, y: size.height))
        }
        .frame(width: size.width, height: size.height, alignment: .topLeading)
    }
}
struct PointLabel: View {
    var offset: CGPoint
    var body: some View {
        Text("\(Int(offset.x)), \(Int(offset.y))")
            .font(.system(size: 12))
            .frame(width: 100, height: 18, alignment: .center)
//            .background(Color.orange)
            .offset(x: offset.x - 50, y: offset.y - 9)
    }
}
struct CircleView: View {
    var offset: CGPoint
    var radius: CGFloat = 25
    var body: some View {
        return Circle()
            .fill(Color.rgb(250, 177, 160))
            .frame(width: radius * 2, height: radius * 2)
            .offset(x: offset.x - radius, y: offset.y - radius)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Device())
    }
}

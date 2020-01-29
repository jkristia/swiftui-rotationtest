//
//  Device.swift
//  positionTest
//
//  Created by jesper kristiansen on 1/29/20.
//  Copyright © 2020 jesper kristiansen. All rights reserved.
//

import Combine
import Foundation

class Device: ObservableObject {
    @Published var isPortrait: Bool = true
}

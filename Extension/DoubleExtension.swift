//
//  DoubleExtension.swift
//  SwiftWeather
//
//  Created by Andriy Tsymbalyuk on 3/23/19.
//

import Foundation

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

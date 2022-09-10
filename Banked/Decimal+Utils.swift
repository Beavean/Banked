//
//  DecimalUtils.swift
//  Banked
//
//  Created by Beavean on 09.09.2022.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}

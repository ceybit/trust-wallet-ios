// Copyright DApps Platform Inc. All rights reserved.

import Foundation
import BigInt
import TrustCore

extension CurrencyRate {
    func estimate(fee: String, with id: String) -> Double? {
        guard let feeInDouble = Double(fee) else {
            return nil
        }
        guard let price = self.rates.filter({ $0.contract == id }).first else {
            return nil
        }
        return price.price * feeInDouble
    }

    func format(fee: Double, formatter: NumberFormatter = CurrencyFormatter.formatter) -> String? {
        return formatter.string(from: NSNumber(value: fee))
    }
}

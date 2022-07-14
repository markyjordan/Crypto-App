//
//  api-response.swift
//  Crypto-App
//
//  Created by Marky Jordan on 7/13/22.
//

import Foundation

struct Crypto: Codable {
    let asset_id: String
    let name: String
    let data_quote_start: String
    let data_quote_end: String
    let volume_1hrs_usd: Double
    let volume_1day_usd: Double
    let volume_1mth_usd: Double
    let price_usd: Double
    let data_start: String
    let data_end: String
}

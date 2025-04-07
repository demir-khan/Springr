//
//  Springr.swift
//  Springr
//
//  Created by Demir Khan on 13/02/2025.
//

import Foundation

let statusList = ["Applied", "Rejected", "Offer Recieved", "Action Required"]
let typeList = ["Spring", "Summer", "Fall", "Winter"]

struct Springr: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var status: String
    var type: String
}

extension Springr {
    static let samples = [
        Springr(title: "Deloite", description: "Spring into Deloite", status: "Rejected", type: "Spring"),
        Springr(title: "DRW", description: "Discover DRW", status: "Rejected", type: "Spring"),
        Springr(title: "Google", description: "Google STEP", status: "Applied", type: "Summer"),
        Springr(title: "JP Morgan", description: "2025 Spring into Software Engineering", status: "Rejected", type: "Spring"),
        Springr(title: "Jane Street", description: "FTTP", status: "Rejected", type: "Spring"),
        Springr(title: "IMC", description: "Launchpad", status: "Applied", type: "Spring"),
        Springr(title: "Jefferies", description: "2025 Information Technology Spring Week", status: "Action Required", type: "Spring"),
        Springr(title: "Goldman Sachs Singapore", description: "Investment banking Summer Analyst", status: "Applied", type: "Summer"),
        Springr(title: "Optiver", description: "Future Focus Quants", status: "Rejected", type: "Spring")
    ]
}

//
//  SpringrsListViewMode.swift
//  Springr
//
//  Created by Demir Khan on 14/02/2025.
//

import Foundation


class SpringrsListViewModel: ObservableObject {
    @Published
    var springrs = Springr.samples
    
    func addSpringr(_ springr: Springr) {
        springrs.append(springr)
    }
}

//
//  DMDataObject.swift
//  DataManager
//
//  Created by Howard Lee on 5/2/17.
//  Copyright © 2017 Howard Lee. All rights reserved.
//

import UIKit

enum DMDataObjectLoadState {
    case initialized
    case loading
    case loaded
    case expired
}

class DMDataObject: NSObject {

    var loadState: DMDataObjectLoadState
    var fetcherClass: AnyClass {
        return DMNilDataFetcher.self
    }

    override init() {
        loadState = .initialized
    }
}

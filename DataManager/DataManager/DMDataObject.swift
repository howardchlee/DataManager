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
    case invalid
}

class DMDataObject: NSObject {

    class var fetcherClass: DMDataFetcher.Type {
        return DMNilDataFetcher.self
    }

    var loadState: DMDataObjectLoadState

    required override init() {
        loadState = .initialized
    }
}

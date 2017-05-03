//
//  DMDataFetcher.swift
//  DataManager
//
//  Created by Howard Lee on 5/2/17.
//  Copyright © 2017 Howard Lee. All rights reserved.
//

import UIKit

protocol DMDataFetcher {
    init()
    func fetch(request: DMDataRequest, dataObject: DMDataObject)
}

class DMNilDataFetcher: DMDataFetcher {
    
    required init() {
        
    }

    func fetch(request: DMDataRequest, dataObject: DMDataObject) {
        dataObject.loadState = .loaded
    }
}

//
//  DMDataFetcher.swift
//  DataManager
//
//  Created by Howard Lee on 5/2/17.
//  Copyright © 2017 Howard Lee. All rights reserved.
//

import UIKit

protocol DMDataFetcher {
    func fetch(withCompletion completion:(DMDataObject?, NSError?)->())
}

class DMNilDataFetcher: DMDataFetcher {
    func fetch(withCompletion completion: (DMDataObject?, NSError?) -> ()) {
        completion(nil, nil)
    }
}

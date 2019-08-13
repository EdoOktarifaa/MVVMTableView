//
//  MoreDataTableViewModel.swift
//  MVVMTableView
//
//  Created by BRI on 12/08/19.
//  Copyright © 2019 BRI. All rights reserved.
//

import Foundation
import UIKit

class MoreDataTableViewModel: NSObject {
    func generateViewModel() -> [MoreHeaderInformation]{
        let profileHeader = MoreHeaderInformation(name: "My Dashboard", info: [MoreCellInformation(name: "Manage", subtitle: nil, action: nil, disclosure: true)
            ])
        let iBeaconHeader = MoreHeaderInformation(name: "iBeacon", info: [MoreCellInformation(name: "Status", subtitle: nil, action: nil, disclosure: false),
                                                                          MoreCellInformation(name: "Status", subtitle: "detail status", action: nil, disclosure: true),
                                                                          MoreCellInformation(name: "Status", subtitle: nil, action: nil, disclosure: false)
            ])
        let otherHeader = MoreHeaderInformation(name: "Others", info: [MoreCellInformation(name: "My Tracker", subtitle: nil, action: nil, disclosure: true),
                                                                       MoreCellInformation(name: "FAQ", subtitle: nil, action: #selector(onClick(vc:)), disclosure: true),
                                                                       MoreCellInformation(name: "Partners", subtitle: nil, action: nil, disclosure: true)
            ])
        
        return [profileHeader, iBeaconHeader, otherHeader]
    }
    
    @objc func onClick(vc parent: UIViewController){
        print("onClick")
    }
}

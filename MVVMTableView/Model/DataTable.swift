//
//  DataTable.swift
//  MVVMTableView
//
//  Created by BRI on 12/08/19.
//  Copyright © 2019 BRI. All rights reserved.
//

import Foundation
import UIKit

struct MoreCellInformation {
    var name: String?
    var subtitle: String?
    var action: Selector?
    var disclosure: Bool?
}

struct MoreHeaderInformation {
    var name: String?
    var info: [MoreCellInformation]
}

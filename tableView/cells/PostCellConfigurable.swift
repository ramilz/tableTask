//
//  PostCellConfigurable.swift
//  tableView
//
//  Created by Артем Иревлин on 17.03.2021.
//

import UIKit

protocol PostCellConfigurable: UITableViewCell {
    func configure(model: PostModelProtocol)
}

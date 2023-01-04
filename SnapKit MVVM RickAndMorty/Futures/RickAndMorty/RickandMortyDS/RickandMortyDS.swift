//
//  RickandMortyDS.swift
//  SnapKit MVVM RickAndMorty
//
//  Created by Kaan Yalçınkaya on 5.09.2022.
//

import Foundation
import UIKit

extension RickAndMortyViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: RickandMortyTableViewCell = tableView.dequeueReusableCell(withIdentifier: RickandMortyTableViewCell.Identifier.custom.rawValue) as? RickandMortyTableViewCell else {
            return UITableViewCell()

        }
        
        cell.saveModel(model: results[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
}


//
//  ResultsViewController.swift
//  test tabela
//
//  Created by user155532 on 5/11/19.
//  Copyright © 2019 sgelves. All rights reserved.
//

import UIKit
import Kingfisher

class ResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, LocaisData {

    @IBOutlet weak var tableView: UITableView!

    var resultData: [Local] = []
    var currentPage: Int = 0
    var isLoading: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getNextPage {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as! ResultCellTableViewCell
        let result = resultData[indexPath.row]
        cell.title.text = result.placeName
        
        if (result.placePhoto != nil) {
            cell.thumbnail.kf.setImage(with: URL(string: result.placePhoto!))
        }
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offset > contentHeight - scrollView.frame.height * 2 {
            self.getNextPage {
                self.tableView.reloadData()
            }
        }
        
    }
}

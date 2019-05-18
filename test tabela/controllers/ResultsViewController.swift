//
//  ResultsViewController.swift
//  test tabela
//
//  Created by user155532 on 5/11/19.
//  Copyright © 2019 sgelves. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, LocaisData {

    @IBOutlet weak var tableView: UITableView!

    var resultData: [Local] = []
    let resultsService = ResultsService()
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
            resultsService.queryUrlImage(url: result.placePhoto!) { image in
                cell.thumbnail.image = image
            }
        }
        
        return cell
    }
}

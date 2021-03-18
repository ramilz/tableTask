//
//  TableViewController.swift
//  tableView
//
//  Created by Артем Иревлин on 17.03.2021.
//

import UIKit

class TableViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var dataSource = [PostModelProtocol]()
    let dataConfigarator = PostDataSourceConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TextPostTableViewCell", bundle: nil), forCellReuseIdentifier: "TextPostTableViewCell")
        tableView.register(UINib(nibName: "ImagePostTableViewCell", bundle: nil), forCellReuseIdentifier: "ImagePostTableViewCell")
        dataSource = dataConfigarator.createPosts()
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select cell at \(indexPath)")
    }
    
}

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if let textModel = dataSource[indexPath.row] as? PostModelText,
           let textCell = tableView.dequeueReusableCell(withIdentifier: "TextPostTableViewCell", for: indexPath) as? TextPostTableViewCell {
            textCell.configure(model: textModel)
            cell = textCell
        } else if let imageModel = dataSource[indexPath.row] as? PostModelImage,
                  let imageCell = tableView.dequeueReusableCell(withIdentifier: "ImagePostTableViewCell", for: indexPath) as? ImagePostTableViewCell {
            imageCell.configure(model: imageModel)
            imageCell.onShowPostTap = { url in
                UIApplication.shared.open(url)
            }
            cell = imageCell
        }

        return cell
    }
}


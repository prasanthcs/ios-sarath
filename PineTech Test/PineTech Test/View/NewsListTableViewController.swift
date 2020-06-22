//
//  NewsListTableViewController.swift
//  PineTech Test
//
//  Created by FairCode on 10/06/20.
//  Copyright © 2020 FairCode. All rights reserved.

import UIKit
import Kingfisher
import ImageSlideshow

class NewsListTableViewController: UITableViewController, newsData {

    var newsDatas : NewsModel?
    var storedOffsets = [Int: CGFloat]()
    var newsListTableViewControllerViewModel = NewsListTableViewControllerViewModel()
    var imagesArray = [AlamofireSource]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsListTableViewControllerViewModel.newsDelegate = self
        newsListTableViewControllerViewModel.newsListApiCall()
    }
    
    func data(newsData: NewsModel) {
        self.newsDatas = newsData
        if newsDatas?.articles?.count != 0 {
            for i in 0..<(newsDatas?.articles?.count)! {
                if newsDatas?.articles?[i].urlToImage != nil {
                    self.imagesArray.append(AlamofireSource(urlString: newsDatas?.articles?[i].urlToImage ?? "")!)
                }
            }
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsDatas?.articles?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageSlideshowTableViewCell", for: indexPath) as! ImageSlideshowTableViewCell
            cell.imagesArray = self.imagesArray
            cell.selectionStyle = .none
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsListTableViewCell", for: indexPath) as! NewsListTableViewCell
            cell.labelTitle.text = newsDatas?.articles?[indexPath.row].title ?? ""
            cell.labelDescription.text = newsDatas?.articles?[indexPath.row].articleDescription ?? ""
            if newsDatas?.articles?[indexPath.row].urlToImage != nil {
                if let url = URL(string: (newsDatas?.articles?[indexPath.row].urlToImage)!) {
                    cell.imageViewNews?.kf.setImage(with: url)
                }
            }
            cell.imageViewNews?.contentMode = .scaleAspectFill
            cell.imageViewNews?.layer.cornerRadius = 10
            cell.imageViewNews?.layer.masksToBounds = true
            cell.selectionStyle = .none
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as! CategoryTableViewCell
        headerCell.selectionStyle = .none
        headerCell.setCollectionViewDataSourceDelegate(self, forRow: 0)
        headerCell.collectionViewOffset = storedOffsets[0] ?? 0
        return headerCell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 67
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 154
        default:
            return 107
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            return
        default:
            let detailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
            detailsViewController.newsDetailsUrl = newsDatas?.articles?[indexPath.row].url ?? ""
            self.navigationController?.pushViewController(detailsViewController, animated: true)
        }
    }
}

extension NewsListTableViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsDatas?.articles?.count ?? 0
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        
        (cell.viewWithTag(20)!).layer.cornerRadius = 10
        (cell.viewWithTag(100) as! UILabel).text = newsDatas?.articles?[indexPath.row].source?.name ?? ""
        return cell
    }

    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        tableView.layoutIfNeeded()
        return CGSize(width: (UIScreen.main.bounds.width / 2) - 20, height: 50)
    }
    
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsViewController.newsDetailsUrl = newsDatas?.articles?[indexPath.row].url ?? ""
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}


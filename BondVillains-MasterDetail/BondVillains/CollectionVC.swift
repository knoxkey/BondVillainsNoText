//
//  CollectionVC.swift
//  BondVillains
//
//  Created by KNOX KEY on 4/27/16.
//  Copyright © 2016 Udacity. All rights reserved.
//

import UIKit

class CollectionVC: UICollectionViewController {
    let allVillains = Villain.allVillains

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.hidden = false
    }


    // MARK: Table View Data Source

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allVillains.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionCell", forIndexPath: indexPath) as! CollectionCell
        let villain = allVillains[indexPath.row]

         // Set the name and image
        cell.collectionText.text = villain.name
        cell.collecionImage?.image = UIImage(named: villain.imageName)

        return cell
    }

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("VillainDetailViewController") as! VillainDetailViewController
        detailController.villain = self.allVillains[indexPath.row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
}
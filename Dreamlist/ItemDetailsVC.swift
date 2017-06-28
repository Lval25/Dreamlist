//
//  ItemDeatilsVCViewController.swift
//  Dreamlist
//
//  Created by Loyd Vallot on 6/20/17.
//  Copyright © 2017 Loyd's Productions. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    @IBOutlet weak var thumbImage: UIImageView!
    
    
    var stores = [Store]()
    var itemToedit: Item?
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
            
        }
        
       
        
        storePicker.dataSource = self
        storePicker.delegate = self
        
        getStores()
        
        if itemToedit != nil {
            loadItemData()
        }
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
//        
//        let store = Store(context: context)
//        store.name = "Apple"
//        let store2 = Store(context: context)
//        store2.name = "Buccees"
//        let store3 = Store(context: context)
//        store3.name = "Chevrolet"
//        let store4 = Store(context: context)
//        store4.name = "Amazon"
//        let store5 = Store(context: context)
//        store5.name = "Ebay"
//        let store6 = Store(context: context)
//        store6.name = "Walmart"
//        
        ad.saveContext()
        
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let store = stores[row]
        return store.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Update when selected
    }
    
    func getStores() {
        
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        do {
            
            self.stores = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
            
        }
        catch{
            // handle the error
        }
    }
    
    
    
    
    @IBAction func savePrssed(_ sender: UIButton) {
        
        var item: Item!
        
        if itemToedit == nil {
            
            item = Item(context: context)
            
        }
        else{
            item = itemToedit
        }
        
        if let title = titleField.text {
            
            item.title = title
        }
        
        if let price = priceField.text {
            
            item.price = (price as NSString).doubleValue
        }
        
        if let details = detailsField.text {
            
            item.details = details
        }
        
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        
        ad.saveContext()
        
        navigationController?.popViewController(animated: true)
        
        
        
        
    }
    
    func loadItemData() {
        
        if let item = itemToedit {
            
            titleField.text = item.title
            priceField.text = "\(item.price)"
            detailsField.text = item.details
            
            if let store = item.toStore {
                
                var index = 0
                
                repeat {
                    // check to make sure the correct store is given with the data we want to edit
                    let s = stores[index]
                    
                    if s.name == store.name {
                        
                        //selects specific row in pickerview
                        storePicker.selectRow(index, inComponent: 0, animated: false)
                        break
                        
                    }
                    index += 1
                    
                } while (index < stores.count)
            }
        }
        
    }
    
    @IBAction func deletePressd(_ sender: UIBarButtonItem) {
        
        //delete tableview cell
        if itemToedit != nil {
            context.delete(itemToedit!)
            ad.saveContext()
        }
        //after deletion go back to list
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addImage(_ sender: UIButton) {
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            thumbImage.image = img
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    
}

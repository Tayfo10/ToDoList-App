//
//  ViewController.swift
//  ListApp
//
//  Created by Tayfun Sener on 20.03.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var alertController = UIAlertController()
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var data = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    @IBAction func didAddBarButtonTapped(_ sender: UIBarButtonItem){
        
        presentAddAlert()
        
    }
    
    
    
    func presentAddAlert(){
        
        alertController = UIAlertController(title: "Yeni Eleman Ekle",
                                            message: nil,
                                            preferredStyle: .alert)
        let defaultButton = UIAlertAction(title: "Ekle",
                                          style: .default){_ in
            
            let cancelButton = UIAlertAction(title: "Vazgec",
                                             style: .cancel)
            
            alertController.addTextField()
            
            alertController.addAction(defaultButton)
            alertController.addAction(cancelButton)
            present(alertController, animated:true)
            
            
            
            presentAlert(title: "Yeni eleman ekle",
                         message: nil,
                         defaultButtonTitle: "ekle",
                         defaultButtonHandler: {_ in
                let text = self.alertController.textFields?.first?.text
                if text != ""{
                    self.data.append((text)!)
                    self.tableView.reloadData()
                } else {
                    self.presentWarningAlert()
                }
                
            },
                         
                         
                         cancelButtonTitle: "Vazgec")
        }
        
        func presentWarningAlert(){
            presentAlert(title: "Uyari",
                         message: "Liste elemani bos olamaz",
                         cancelButtonTitle: "Tamam")
        }
        
        func presentAlert(title: String?,
                          message: String?,
                          preferredStyle: UIAlertController.Style = .alert,
                          defaultButtonTitle: String? = nil,
                          defaultButtonHandler: ((UIAlertAction)-> Void)? = nil,
                          cancelButtonTitle: String?){
            
            let alertController = UIAlertController(title: title,
                                                    message: message,
                                                    preferredStyle: preferredStyle)
            
            let defaultButton = UIAlertAction(title: defaultButtonTitle,
                                              style: .default,
                                              handler: defaultButtonHandler)
            
            let cancelButton = UIAlertAction(title: cancelButtonTitle,
                                             style: .cancel)
            
            alertController.addAction(defaultButton)
            alertController.addAction(cancelButton)
            
            present(alertController, animated: true)
            
        }
    }
    
}

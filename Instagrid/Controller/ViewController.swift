//
//  ViewController.swift
//  Instagrid
//
//  Created by ISABELLE Terwagne on 10/02/2019.
//  Copyright © 2019 ISABELLE Terwagne. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak private var selectedView: SelectedView!
    
    let pickerController = UIImagePickerController()
    var selectedImage: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        selectedView.style = .secondView
        setupTapGestureRecogniser()
        
    }
    fileprivate func setupTapGestureRecogniser() {
        selectedView.images.forEach { image in
            image.isUserInteractionEnabled = true
            image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(insertPhoto)))
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let selectedImage: UIImage = (info[.originalImage] as? UIImage)!
        self.selectedImage?.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @objc fileprivate func insertPhoto(_ sender: UITapGestureRecognizer) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        if sender.state != .ended { return}
        selectedImage = sender.view as? UIImageView
        self.present(imagePicker, animated: true, completion: nil)
}
}

//
//  ViewController.swift
//  imagepicker
//
//  Created by  Akhil Surendran on 29/10/22.
//

import UIKit

class ViewController: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func selectimage(_ sender: Any) {
        let pic = UIImagePickerController()
//        pic.sourceType = .photoLibrary
//        pic.allowsEditing = true
        pic.delegate = self
        
        let  action = UIAlertController(title: "Photo Selector", message: "Choose photo", preferredStyle: .actionSheet)
        
        action.addAction(UIAlertAction(title: "Photo Library", style: .default,handler: {(action:UIAlertAction) in pic.sourceType = .photoLibrary
            self.present(pic, animated: true)
        }))
    
        action.addAction(UIAlertAction(title: "camera", style: .default,handler: {(action:UIAlertAction) in pic.sourceType = .camera
            self.present(pic, animated: true)
        }))
        
        present(action, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("\(info)")
        if let image = info [UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerOriginalImage")] as? UIImage
        {
            imageView.image = image
            print("image selected")
        }
        picker.dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }

}


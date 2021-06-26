//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Rian on 24/06/21.
//

import UIKit
 
class ViewController: UIViewController {
 
    @IBOutlet weak var diCoding: UILabel!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Mengubah teks
        diCoding.text = "Halo sobat DiCoding"
        
        // Mengambil teks
        print(diCoding.text ?? "Tidak dapat menemukan text  ")
    }
}

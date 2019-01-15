//
//  AdviceViewController.swift
//  Frend`s Advice
//
//  Created by Артем on 10/12/2018.
//  Copyright © 2018 Gukov.space. All rights reserved.
//

import UIKit

let url = "http://fucking-great-advice.ru/api/random/"

class AdviceViewController: UIViewController {

    @IBOutlet weak var viewView: UIView!
    @IBOutlet weak var labelTextAdvice: UILabel!
    @IBOutlet weak var buttonView: UIButton!
    
    private var advices = [Advice]()
    
    @objc func takeMeDataAdvice() {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            guard let data = data else { return }
            do {
                let advice = try JSONDecoder().decode(Advice.self, from: data)
                
                DispatchQueue.main.async {
                    self.labelTextAdvice.text = "\(advice.text)"
                    self.labelTextAdvice.isHidden = false
                }
                
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelTextAdvice.isHidden = true
        view.layer.cornerRadius = 10
        viewView.layer.cornerRadius = 10
        buttonView.layer.cornerRadius = buttonView.bounds.width / 2
        takeMeDataAdvice()
    }
    
    @IBAction func refreshAction(_ sender: UIButton) {
        
        buttonView.rotate()
        
        perform(#selector(takeMeDataAdvice), with: nil, afterDelay: 0.2)
    }
}

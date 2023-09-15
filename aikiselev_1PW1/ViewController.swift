//
//  ViewController.swift
//  aikiselev_1PW1
//
//  Created by Alexey Kiselev on 15.09.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet var views: [UIView]!
    
    override func viewDidLoad() {
        setUniqueColors(colors: getUniqueColors(count: views.count))
        changeShapes()
        super.viewDidLoad()
    }
    
    @IBAction func buttonWasPressed(_ sender: Any) {
        button.isEnabled = false
        let colors = getUniqueColors(count: views.count)
        UIView.animate(withDuration: 1.5, animations: {
            self.setUniqueColors(colors: colors)
            self.changeShapes()
        },
        completion: { [weak self] _ in
            self?.button.isEnabled = true
            })
    }
    
    func getUniqueColors(count: Int) -> Set<UIColor>{
        var set = Set<UIColor>()
        while set.count < count {
        set.insert(
        UIColor(
        red: .random(in: 0...1),
        green: .random(in: 0...1),
        blue: .random(in: 0...1),
        alpha: 1))
        }
        return set
    }
    
    func setUniqueColors(colors: Set<UIColor>){
        var tempColors = colors
        for view in views{
            view.backgroundColor = tempColors.popFirst()
        }
    }
    
    func changeShapes(){
        for view in views{
            view.layer.cornerRadius = .random(in: 0...25)
        }
    }
}

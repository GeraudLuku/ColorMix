//
//  ViewController.swift
//  ColorMix
//
//  Created by Geraud Luku on 8/18/20.
//  Copyright © 2020 Geraud Luku .Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        colorView.layer.borderWidth = 5
        colorView.layer.cornerRadius = 10
        colorView.layer.borderColor = UIColor.black.cgColor
        
        updateControls()
        
        updateColor()
    }

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    @IBAction func switchedChanged(_ sender: UISwitch) {
        updateColor()
    }
    
    
    func updateColor() {
        var red:CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        
        //update controls
        updateControls()
        
        if redSwitch.isOn{
            red = CGFloat(redSlider.value)
        }
        if greenSwitch.isOn{
            green = CGFloat(greenSlider.value)
        }
        if blueSwitch.isOn{
            blue = CGFloat(blueSlider.value)
        }
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        colorView.backgroundColor = color
    }
    
    func updateControls(){
        redSlider.isEnabled = redSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        updateColor()
    }
    
    @IBAction func reset(_ sender: UIButton) {
        //set the value of each slider to 1
        redSlider.value = 1
        blueSlider.value = 1
        greenSlider.value = 1
        
        //set the value of each switch to 1
        redSwitch.isOn = false
        greenSwitch.isOn = false
        blueSwitch.isOn = false
        
        //update controls
        updateControls()
        
        //update the color of the view
        updateColor()
    }
    
}


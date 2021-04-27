//
//  ViewController.swift
//  紙娃娃
//
//  Created by 蔡佳穎 on 2021/4/24.
//

import UIKit

class ViewController: UIViewController {

    //model各部位+bgColorImageView
    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var faceImageView: UIImageView!
    @IBOutlet weak var accessoriesImageView: UIImageView!
    @IBOutlet weak var bodyImageView: UIImageView!
    @IBOutlet weak var bgColorImageView: UIView!
    
    //放個身體部位Btn的view
    @IBOutlet var headBtnView: UIView!
    @IBOutlet var faceBtnView: UIView!
    @IBOutlet var accessoriesBtnView: UIView!
    @IBOutlet var bodyBtnView: UIView!
    @IBOutlet var bgBtnView: UIView!
    
    //bagroundColor view上的slider/image/label
    @IBOutlet weak var color1RSlider: UISlider!
    @IBOutlet weak var color1GSlider: UISlider!
    @IBOutlet weak var color1BSlider: UISlider!
    @IBOutlet weak var color1AlphaSlider: UISlider!
    @IBOutlet weak var color1Preview: UIImageView!
    @IBOutlet weak var color2RSlider: UISlider!
    @IBOutlet weak var color2GSlider: UISlider!
    @IBOutlet weak var color2BSlider: UISlider!
    @IBOutlet weak var color2AlphaSlider: UISlider!
    @IBOutlet weak var color2Preview: UIImageView!
    
    @IBOutlet weak var color1RLabel: UILabel!
    @IBOutlet weak var color1GLabel: UILabel!
    @IBOutlet weak var color1BLabel: UILabel!
    @IBOutlet weak var color1AlphaLabel: UILabel!
    @IBOutlet weak var color2RLabel: UILabel!
    @IBOutlet weak var color2GLabel: UILabel!
    @IBOutlet weak var color2BLabel: UILabel!
    @IBOutlet weak var color2AlphaLabel: UILabel!
    
    var color1 = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    var color2 = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    var randomColor1 = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    var randomColor2 = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    
    var red1: Float = 0/255
    var green1: Float = 0/255
    var blue1: Float = 0/255
    var alpha1: Float = 1
    var red2: Float = 0/255
    var green2: Float = 0/255
    var blue2 : Float = 0/255
    var alpha2: Float = 1
    
    let gradientLayer = CAGradientLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headBtnView.isHidden = false
        faceBtnView.isHidden = true
        accessoriesBtnView.isHidden = true
        bodyBtnView.isHidden = true
        bgBtnView.isHidden = true
        
        
        gradientLayer.frame = bgColorImageView.bounds
        gradientLayer.colors =
            [UIColor(red: 99/255, green: 111/255, blue: 164/255, alpha: 1),
             UIColor(red: 232/255, green: 203/255, blue: 192/255, alpha: 1)]
        bgColorImageView.layer.addSublayer(gradientLayer)
        
    }

    //更換view的Btn
    @IBAction func changeViewBtn(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            headBtnView.isHidden = false
            faceBtnView.isHidden = true
            accessoriesBtnView.isHidden = true
            bodyBtnView.isHidden = true
            bgBtnView.isHidden = true
        case 1:
            headBtnView.isHidden = true
            faceBtnView.isHidden = false
            accessoriesBtnView.isHidden = true
            bodyBtnView.isHidden = true
            bgBtnView.isHidden = true
        case 2:
            headBtnView.isHidden = true
            faceBtnView.isHidden = true
            accessoriesBtnView.isHidden = false
            bodyBtnView.isHidden = true
            bgBtnView.isHidden = true
        case 3:
            headBtnView.isHidden = true
            faceBtnView.isHidden = true
            accessoriesBtnView.isHidden = true
            bodyBtnView.isHidden = false
            bgBtnView.isHidden = true
        case 4:
            headBtnView.isHidden = true
            faceBtnView.isHidden = true
            accessoriesBtnView.isHidden = true
            bodyBtnView.isHidden = true
            bgBtnView.isHidden = false
        default:
            break
        }
    }
    
    //身體各部位的每個小圖Btn
    @IBAction func changeHeadBtn(_ sender: UIButton) {
        let image = sender.currentImage
        headImageView.image = image //指定model的headImageView圖片為Btn回傳的圖片
    }
    
    @IBAction func changeFaceBtn(_ sender: UIButton) {
        let image = sender.currentImage
        faceImageView.image = image
    }
    
    @IBAction func changeGlassesBtn(_ sender: UIButton) {
        let image = sender.currentImage
        accessoriesImageView.image = image
        if image?.isSymbolImage == true {
            accessoriesImageView.image = nil
        }
    }
    
    @IBAction func changeBodyBtn(_ sender: UIButton) {
        let image = sender.currentImage
        bodyImageView.image = image
    }
    
    
    
    @IBAction func RandomBtn(_ sender: UIButton) {
        
        //定義RGB亂數
        red1 = Float.random(in: 1...255)/255
        green1 = Float.random(in: 1...255)/255
        blue1 = Float.random(in: 1...255)/255
        alpha1 = Float.random(in: 1...255)/255
        red2 = Float.random(in: 1...255)/255
        green2 = Float.random(in: 1...255)/255
        blue2 = Float.random(in: 1...255)/255
        alpha2 = Float.random(in: 1...255)/255
        
        //兩個顏色＆preview image
        randomColor1 = UIColor(red: CGFloat(red1), green: CGFloat(green1), blue: CGFloat(blue1), alpha: CGFloat(alpha1))
        randomColor2 = UIColor(red: CGFloat(red2), green: CGFloat(green2), blue: CGFloat(blue2), alpha: CGFloat(alpha2))
        color1Preview.backgroundColor = randomColor1
        color2Preview.backgroundColor = randomColor2
        
        //漸層
        gradientLayer.frame = bgColorImageView.bounds
        gradientLayer.colors = [randomColor1.cgColor, randomColor2.cgColor]
        bgColorImageView.layer.addSublayer(gradientLayer)
        
        //slider連動
        color1RSlider.value = red1
        color1GSlider.value = green1
        color1BSlider.value = blue1
        color1AlphaSlider.value = alpha1
        color2RSlider.value = red2
        color2GSlider.value = green2
        color2BSlider.value = blue2
        color2AlphaSlider.value = alpha2
        
        //label
        color1RLabel.text = String(format: "%.0f", color1RSlider.value*255)
        color1GLabel.text = String(format: "%.0f", color1GSlider.value*255)
        color1BLabel.text = String(format: "%.0f", color1BSlider.value*255)
        color1AlphaLabel.text = String(format: "%.1f", color1AlphaSlider.value)
        
        color2RLabel.text = String(format: "%.0f", color2RSlider.value*255)
        color2GLabel.text = String(format: "%.0f", color2GSlider.value*255)
        color2BLabel.text = String(format: "%.0f", color2BSlider.value*255)
        color2AlphaLabel.text = String(format: "%.1f", color2AlphaSlider.value)

    }
    @IBAction func clearBtn(_ sender: UIButton) {
        
        //顏色清除
        red1 = 255/255
        green1 = 255/255
        blue1 = 255/255
        alpha1 = 1
        red2 = 255/255
        green2 = 255/255
        blue2 = 255/255
        alpha2 = 1

        //兩個顏色＆preview image
        color1 = UIColor(red: CGFloat(color1RSlider.value), green: CGFloat(color1GSlider.value), blue: CGFloat(color1BSlider.value), alpha: CGFloat(color1AlphaSlider.value))
        color2 = UIColor(red: CGFloat(color2RSlider.value), green: CGFloat(color2GSlider.value), blue: CGFloat(color2BSlider.value), alpha: CGFloat(color2AlphaSlider.value))
        color1Preview.backgroundColor = color1
        color2Preview.backgroundColor = color2
        
        //漸層remove
        gradientLayer.removeFromSuperlayer()
        
        //slider連動
        color1RSlider.value = red1
        color1GSlider.value = green1
        color1BSlider.value = blue1
        color1AlphaSlider.value = alpha1
        color2RSlider.value = red2
        color2GSlider.value = green2
        color2BSlider.value = blue2
        color2AlphaSlider.value = alpha2
        
        //label
        color1RLabel.text = String(format: "%.0f", color1RSlider.value*255)
        color1GLabel.text = String(format: "%.0f", color1GSlider.value*255)
        color1BLabel.text = String(format: "%.0f", color1BSlider.value*255)
        color1AlphaLabel.text = String(format: "%.1f", color1AlphaSlider.value)
        
        color2RLabel.text = String(format: "%.0f", color2RSlider.value*255)
        color2GLabel.text = String(format: "%.0f", color2GSlider.value*255)
        color2BLabel.text = String(format: "%.0f", color2BSlider.value*255)
        color2AlphaLabel.text = String(format: "%.1f", color2AlphaSlider.value)
    
    }
    @IBAction func changeColor(_ sender: Any) {
        
        //兩個顏色＆preview image
        color1 = UIColor(red: CGFloat(color1RSlider.value), green: CGFloat(color1GSlider.value), blue: CGFloat(color1BSlider.value), alpha: CGFloat(color1AlphaSlider.value))
        color2 = UIColor(red: CGFloat(color2RSlider.value), green: CGFloat(color2GSlider.value), blue: CGFloat(color2BSlider.value), alpha: CGFloat(color2AlphaSlider.value))
        color1Preview.backgroundColor = color1
        color2Preview.backgroundColor = color2
        
        //漸層
        gradientLayer.frame = bgColorImageView.bounds
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        bgColorImageView.layer.addSublayer(gradientLayer)
            
        //label
        color1RLabel.text = String(format: "%.0f", color1RSlider.value*255)
        color1GLabel.text = String(format: "%.0f", color1GSlider.value*255)
        color1BLabel.text = String(format: "%.0f", color1BSlider.value*255)
        color1AlphaLabel.text = String(format: "%.1f", color1AlphaSlider.value)
        
        color2RLabel.text = String(format: "%.0f", color2RSlider.value*255)
        color2GLabel.text = String(format: "%.0f", color2GSlider.value*255)
        color2BLabel.text = String(format: "%.0f", color2BSlider.value*255)
        color2AlphaLabel.text = String(format: "%.1f", color2AlphaSlider.value)
        
    }
}


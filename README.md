<h1 align="center"> BullsEye </h1>
<p align="center">A Number guessing game </p>

<center>
<img align="center" src="https://i.ibb.co/T4gBB3N/Screenshot-2019-01-05-at-1-32-45-PM.jpg" alt="Screenshot-2019-01-05-at-1-32-45-PM" border="0">
</center>

TechUsed: 
1. Xcode
2. Swift (language)
3. WebKit
4. UIKit

Made with love by Piyush Mehta


# LOGIC: 
```swift
//
//  ViewController.swift
//  BullsEye
//
//  Created by piyush mehta on 03/01/19.
//  Copyright © 2019 piyushmehta. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 50
    var targetValue: Int = 0
    var score = 0
    var roundNumber = 1

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var RoundLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewGame()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlight = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlight, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }

    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue)
        var points = (100 - difference)
        score += points
        
        let title: String
        if difference == 0 {
            title = "Perfect"
            points += 100
        } else if difference < 5 {
            title = "You almost had it"
            points += 50
        } else if difference < 10 {
            title = "Pretty Good"
        } else {
            title = "Not even Close..."
        }
        let message = "The value of the slider is now: \(currentValue)\n the target value is \(targetValue) \n difference is \(difference)"

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }

    @IBAction func sliderMoved(slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
        roundNumber += 1
    }

    func updateLabels() {
        targetLabel.text = String(targetValue)
        ScoreLabel.text = String(score)
        RoundLabel.text = String(roundNumber)
    }
    
 @IBAction func startNewGame() {
        score = 0
        roundNumber = 1
        startNewRound()
    }
    
}
```

# UI
```xml
<?xml version="1.0" encoding="UTF-8"?>
<document type="com.apple.InterfaceBuilder3.CocoaTouch.Storyboard.XIB" version="3.0" toolsVersion="14460.31" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" useAutolayout="YES" useTraitCollections="YES" useSafeAreas="YES" colorMatched="YES" initialViewController="BYZ-38-t0r">
    <device id="retina4_0" orientation="landscape">
        <adaptation id="fullscreen"/>
    </device>
    <dependencies>
        <deployment identifier="iOS"/>
        <plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="14460.20"/>
        <capability name="Safe area layout guides" minToolsVersion="9.0"/>
        <capability name="documents saved in the Xcode 8 format" minToolsVersion="8.0"/>
    </dependencies>
    <scenes>
        <!--View Controller-->
        <scene sceneID="tne-QT-ifu">
            <objects>
                <viewController id="BYZ-38-t0r" customClass="ViewController" customModule="BullsEye" customModuleProvider="target" sceneMemberID="viewController">
                    <view key="view" contentMode="scaleToFill" id="8bC-Xf-vdC">
                        <rect key="frame" x="0.0" y="0.0" width="568" height="320"/>
                        <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                        <subviews>
                            <imageView userInteractionEnabled="NO" contentMode="scaleToFill" horizontalHuggingPriority="251" verticalHuggingPriority="251" image="Background" translatesAutoresizingMaskIntoConstraints="NO" id="qZK-6k-brV">
                                <rect key="frame" x="0.0" y="0.0" width="852" height="320"/>
                                <constraints>
                                    <constraint firstAttribute="height" constant="393" id="bU9-SK-Z51"/>
                                    <constraint firstAttribute="width" constant="852" id="mFz-u1-NCm"/>
                                </constraints>
                            </imageView>
                            <button opaque="NO" contentMode="scaleToFill" fixedFrame="YES" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="roundedRect" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="gSx-H9-ojj">
                                <rect key="frame" x="51" y="298" width="71" height="30"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <state key="normal" title="Start Over">
                                    <color key="titleColor" white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
                                </state>
                                <connections>
                                    <action selector="startNewGame" destination="BYZ-38-t0r" eventType="touchUpInside" id="9WO-Mb-H7G"/>
                                </connections>
                            </button>
                            <slider opaque="NO" contentMode="scaleToFill" fixedFrame="YES" contentHorizontalAlignment="center" contentVerticalAlignment="center" value="50" minValue="1" maxValue="100" translatesAutoresizingMaskIntoConstraints="NO" id="mgL-zQ-SZp">
                                <rect key="frame" x="91" y="100" width="485" height="30"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <connections>
                                    <action selector="sliderMovedWithSlider:" destination="BYZ-38-t0r" eventType="valueChanged" id="2Qk-Fa-dFc"/>
                                </connections>
                            </slider>
                            <label opaque="NO" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" fixedFrame="YES" text="1" textAlignment="natural" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="r2D-8u-WbX">
                                <rect key="frame" x="51" y="104" width="8" height="21"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <fontDescription key="fontDescription" type="system" pointSize="17"/>
                                <color key="textColor" white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
                                <nil key="highlightedColor"/>
                            </label>
                            <label opaque="NO" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" fixedFrame="YES" text="Score:" textAlignment="natural" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="U8w-L4-122">
                                <rect key="frame" x="161" y="304" width="50" height="21"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <fontDescription key="fontDescription" type="system" pointSize="17"/>
                                <color key="textColor" white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
                                <nil key="highlightedColor"/>
                            </label>
                            <label opaque="NO" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" fixedFrame="YES" text="Put the Bull's Eye as close as you can to:" textAlignment="natural" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsLetterSpacingToFitWidth="YES" highlighted="YES" adjustsFontForContentSizeCategory="YES" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="KgG-mv-Pdg">
                                <rect key="frame" x="161" y="41" width="310" height="21"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <color key="tintColor" white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
                                <fontDescription key="fontDescription" type="system" pointSize="17"/>
                                <color key="textColor" white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
                                <color key="highlightedColor" white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
                                <color key="shadowColor" cocoaTouchSystemColor="darkTextColor"/>
                                <size key="shadowOffset" width="-4" height="3"/>
                            </label>
                            <label opaque="NO" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" fixedFrame="YES" text="Label" textAlignment="natural" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="hML-iI-spu">
                                <rect key="frame" x="219" y="304" width="42" height="21"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <accessibility key="accessibilityConfiguration" identifier="ScoreLabel"/>
                                <fontDescription key="fontDescription" type="system" pointSize="17"/>
                                <color key="textColor" white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
                                <nil key="highlightedColor"/>
                            </label>
                            <button opaque="NO" contentMode="scaleToFill" fixedFrame="YES" contentHorizontalAlignment="center" contentVerticalAlignment="center" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="Pmk-Sc-JuU">
                                <rect key="frame" x="541" y="303" width="10" height="22"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <state key="normal" image="InfoButton" backgroundImage="InfoButton"/>
                                <state key="disabled" image="InfoButton" backgroundImage="InfoButton"/>
                                <state key="highlighted" image="InfoButton" backgroundImage="InfoButton"/>
                                <connections>
                                    <segue destination="zh4-Ij-DcP" kind="presentation" modalTransitionStyle="flipHorizontal" id="8SL-Bw-27v"/>
                                </connections>
                            </button>
                            <label opaque="NO" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" fixedFrame="YES" text="100" textAlignment="natural" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsLetterSpacingToFitWidth="YES" highlighted="YES" adjustsFontForContentSizeCategory="YES" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="54R-gT-rwq">
                                <rect key="frame" x="479" y="41" width="29" height="21"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <color key="tintColor" white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
                                <fontDescription key="fontDescription" type="system" pointSize="17"/>
                                <color key="textColor" white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
                                <color key="highlightedColor" white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
                                <color key="shadowColor" cocoaTouchSystemColor="darkTextColor"/>
                            </label>
                            <label opaque="NO" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" fixedFrame="YES" text="100" textAlignment="natural" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="9fz-m7-meF">
                                <rect key="frame" x="582" y="104" width="29" height="21"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <fontDescription key="fontDescription" type="system" pointSize="17"/>
                                <color key="textColor" white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
                                <nil key="highlightedColor"/>
                            </label>
                            <label opaque="NO" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" fixedFrame="YES" text="Round" textAlignment="natural" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="btG-IS-rNt">
                                <rect key="frame" x="381" y="304" width="50" height="21"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <fontDescription key="fontDescription" type="system" pointSize="17"/>
                                <color key="textColor" white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
                                <nil key="highlightedColor"/>
                            </label>
                            <label opaque="NO" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" fixedFrame="YES" text="999" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="nyd-RB-mwY">
                                <rect key="frame" x="439" y="304" width="32" height="21"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <fontDescription key="fontDescription" name=".AppleSystemUIFont" family=".AppleSystemUIFont" pointSize="17"/>
                                <color key="textColor" white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
                                <nil key="highlightedColor"/>
                            </label>
                            <button opaque="NO" contentMode="scaleToFill" fixedFrame="YES" contentHorizontalAlignment="center" contentVerticalAlignment="center" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="MPy-0R-SYG">
                                <rect key="frame" x="283" y="172" width="100" height="37"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <fontDescription key="fontDescription" style="UICTFontTextStyleHeadline"/>
                                <state key="normal" title="HIT ME" backgroundImage="Button-Normal">
                                    <color key="titleColor" white="0.0" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
                                </state>
                                <state key="highlighted" image="Background" backgroundImage="Button-Highlighted"/>
                                <connections>
                                    <action selector="showAlert" destination="BYZ-38-t0r" eventType="touchUpInside" id="qys-Gf-Jzq"/>
                                </connections>
                            </button>
                            <label opaque="NO" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" fixedFrame="YES" text="Made By Piyush Mehta" textAlignment="natural" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="Mq5-YG-HTf">
                                <rect key="frame" x="472" y="346" width="175" height="21"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <fontDescription key="fontDescription" type="system" pointSize="17"/>
                                <color key="textColor" white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
                                <nil key="highlightedColor"/>
                            </label>
                        </subviews>
                        <color key="backgroundColor" cocoaTouchSystemColor="groupTableViewBackgroundColor"/>
                        <constraints>
                            <constraint firstItem="qZK-6k-brV" firstAttribute="leading" secondItem="6Tk-OE-BBY" secondAttribute="leading" id="6fG-ky-rtA"/>
                            <constraint firstItem="qZK-6k-brV" firstAttribute="bottom" secondItem="6Tk-OE-BBY" secondAttribute="bottom" id="7oJ-dx-b5P"/>
                            <constraint firstItem="qZK-6k-brV" firstAttribute="trailing" secondItem="6Tk-OE-BBY" secondAttribute="trailing" id="KTc-wd-Gvb"/>
                            <constraint firstItem="qZK-6k-brV" firstAttribute="leading" secondItem="8bC-Xf-vdC" secondAttribute="leading" id="Loi-RZ-HzC"/>
                            <constraint firstItem="qZK-6k-brV" firstAttribute="top" secondItem="6Tk-OE-BBY" secondAttribute="top" id="NTk-FM-0Ur"/>
                            <constraint firstItem="6Tk-OE-BBY" firstAttribute="trailing" secondItem="qZK-6k-brV" secondAttribute="trailing" id="WxU-oh-oZH"/>
                            <constraint firstItem="qZK-6k-brV" firstAttribute="bottom" secondItem="6Tk-OE-BBY" secondAttribute="bottom" id="aA2-aw-EU0"/>
                            <constraint firstItem="qZK-6k-brV" firstAttribute="trailing" secondItem="6Tk-OE-BBY" secondAttribute="trailing" id="nG2-a8-2Q2"/>
                            <constraint firstItem="qZK-6k-brV" firstAttribute="leading" secondItem="8bC-Xf-vdC" secondAttribute="leading" id="sjE-GB-jno"/>
                            <constraint firstItem="6Tk-OE-BBY" firstAttribute="bottom" secondItem="qZK-6k-brV" secondAttribute="bottom" id="udb-XI-JW8"/>
                            <constraint firstItem="qZK-6k-brV" firstAttribute="top" secondItem="6Tk-OE-BBY" secondAttribute="top" id="ueu-eu-aDd"/>
                        </constraints>
                        <viewLayoutGuide key="safeArea" id="6Tk-OE-BBY"/>
                    </view>
                    <connections>
                        <outlet property="RoundLabel" destination="nyd-RB-mwY" id="ofx-AP-F22"/>
                        <outlet property="ScoreLabel" destination="hML-iI-spu" id="DDW-Bi-NMI"/>
                        <outlet property="slider" destination="mgL-zQ-SZp" id="qEF-Ff-YA5"/>
                        <outlet property="targetLabel" destination="54R-gT-rwq" id="zsX-6P-jir"/>
                    </connections>
                </viewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="dkx-z0-nzr" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="16.641679160419791" y="39.200000000000003"/>
        </scene>
        <!--About View Controller-->
        <scene sceneID="bee-G4-Sk2">
            <objects>
                <viewController id="zh4-Ij-DcP" customClass="AboutViewController" customModule="BullsEye" customModuleProvider="target" sceneMemberID="viewController">
                    <view key="view" contentMode="scaleToFill" id="Yoh-hp-T2l">
                        <rect key="frame" x="0.0" y="0.0" width="568" height="320"/>
                        <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                        <subviews>
                            <imageView userInteractionEnabled="NO" contentMode="scaleToFill" horizontalHuggingPriority="251" verticalHuggingPriority="251" misplaced="YES" image="Background" translatesAutoresizingMaskIntoConstraints="NO" id="4B4-Aa-Mj8">
                                <rect key="frame" x="0.0" y="-104" width="746" height="424"/>
                                <constraints>
                                    <constraint firstAttribute="height" constant="355" id="ZPa-x0-0b7"/>
                                    <constraint firstAttribute="width" constant="551" id="mVW-LZ-xLZ"/>
                                </constraints>
                            </imageView>
                            <button opaque="NO" contentMode="scaleToFill" fixedFrame="YES" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="roundedRect" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="a7C-IZ-XuK">
                                <rect key="frame" x="314" y="312" width="39" height="8"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <state key="normal" title="Close"/>
                                <connections>
                                    <action selector="close" destination="zh4-Ij-DcP" eventType="touchUpInside" id="2vy-bC-n7E"/>
                                </connections>
                            </button>
                            <textView clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="scaleToFill" fixedFrame="YES" editable="NO" text="Made By Piyush Mehta" textAlignment="center" adjustsFontForContentSizeCategory="YES" selectable="NO" translatesAutoresizingMaskIntoConstraints="NO" id="wMQ-kq-9fH">
                                <rect key="frame" x="10" y="57" width="647" height="247"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <fontDescription key="fontDescription" type="system" pointSize="14"/>
                                <textInputTraits key="textInputTraits" autocapitalizationType="sentences"/>
                            </textView>
                            <imageView userInteractionEnabled="NO" contentMode="scaleToFill" horizontalHuggingPriority="251" verticalHuggingPriority="251" fixedFrame="YES" image="IMG_6582" translatesAutoresizingMaskIntoConstraints="NO" id="qHG-r8-VpT">
                                <rect key="frame" x="88" y="90" width="501" height="202"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                            </imageView>
                        </subviews>
                        <color key="backgroundColor" white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
                        <constraints>
                            <constraint firstItem="ybz-mF-ztP" firstAttribute="trailing" secondItem="4B4-Aa-Mj8" secondAttribute="trailing" id="27R-5V-ifI"/>
                            <constraint firstItem="ybz-mF-ztP" firstAttribute="trailing" secondItem="4B4-Aa-Mj8" secondAttribute="trailing" id="3N1-mp-Ke0"/>
                            <constraint firstItem="ybz-mF-ztP" firstAttribute="bottom" secondItem="4B4-Aa-Mj8" secondAttribute="bottom" id="5WC-a6-q1L"/>
                            <constraint firstItem="4B4-Aa-Mj8" firstAttribute="top" secondItem="ybz-mF-ztP" secondAttribute="top" id="6Gp-1o-2jK"/>
                            <constraint firstItem="4B4-Aa-Mj8" firstAttribute="top" secondItem="ybz-mF-ztP" secondAttribute="top" constant="20" id="8wJ-oU-Cjs"/>
                            <constraint firstItem="4B4-Aa-Mj8" firstAttribute="top" secondItem="ybz-mF-ztP" secondAttribute="top" id="DuW-6A-gHP"/>
                            <constraint firstAttribute="bottom" secondItem="4B4-Aa-Mj8" secondAttribute="bottom" id="ET2-mX-m2I"/>
                            <constraint firstItem="ybz-mF-ztP" firstAttribute="trailing" secondItem="4B4-Aa-Mj8" secondAttribute="trailing" id="Hoz-Q6-2NK"/>
                            <constraint firstItem="ybz-mF-ztP" firstAttribute="trailing" secondItem="4B4-Aa-Mj8" secondAttribute="trailing" id="IYb-lf-7a8"/>
                            <constraint firstItem="4B4-Aa-Mj8" firstAttribute="leading" secondItem="ybz-mF-ztP" secondAttribute="leading" id="KNM-ty-gV7"/>
                            <constraint firstItem="4B4-Aa-Mj8" firstAttribute="top" secondItem="ybz-mF-ztP" secondAttribute="top" id="O6x-7K-bTn"/>
                            <constraint firstItem="4B4-Aa-Mj8" firstAttribute="top" secondItem="ybz-mF-ztP" secondAttribute="top" id="PAD-8l-JGb"/>
                            <constraint firstItem="ybz-mF-ztP" firstAttribute="trailing" secondItem="4B4-Aa-Mj8" secondAttribute="trailing" id="Ua4-Kk-C7b"/>
                            <constraint firstItem="ybz-mF-ztP" firstAttribute="trailing" secondItem="4B4-Aa-Mj8" secondAttribute="trailing" constant="185" id="Ut7-HV-L8M"/>
                            <constraint firstAttribute="trailing" secondItem="4B4-Aa-Mj8" secondAttribute="trailing" id="W31-wh-gFT"/>
                            <constraint firstItem="ybz-mF-ztP" firstAttribute="bottom" secondItem="4B4-Aa-Mj8" secondAttribute="bottom" id="b1y-co-C9X"/>
                            <constraint firstItem="4B4-Aa-Mj8" firstAttribute="leading" secondItem="Yoh-hp-T2l" secondAttribute="leading" id="jyg-hU-1aF"/>
                            <constraint firstItem="4B4-Aa-Mj8" firstAttribute="top" secondItem="ybz-mF-ztP" secondAttribute="top" id="pHh-9d-pPu"/>
                            <constraint firstAttribute="trailing" secondItem="4B4-Aa-Mj8" secondAttribute="trailing" constant="-10" id="rV9-oR-oOG"/>
                            <constraint firstAttribute="bottom" secondItem="4B4-Aa-Mj8" secondAttribute="bottom" constant="19" id="voi-Wg-Ydl"/>
                        </constraints>
                        <viewLayoutGuide key="safeArea" id="ybz-mF-ztP"/>
                    </view>
                    <connections>
                        <outlet property="webView" destination="wMQ-kq-9fH" id="lnd-lq-kp9"/>
                    </connections>
                </viewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="6Py-Yi-DSt" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="696.19565217391312" y="36.231884057971016"/>
        </scene>
    </scenes>
    <resources>
        <image name="Background" width="568" height="320"/>
        <image name="Button-Highlighted" width="100" height="37"/>
        <image name="Button-Normal" width="100" height="37"/>
        <image name="IMG_6582" width="5184" height="3456"/>
        <image name="InfoButton" width="10" height="22"/>
    </resources>
</document>
```

# Copyright © 2019 piyushmehta. All rights reserved.

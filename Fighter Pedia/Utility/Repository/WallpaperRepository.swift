//
//  WallpaperRepository.swift
//  Fighter Pedia
//
//  Created by Ahsan Khalil🤕 on 08/10/2020.
//

import Foundation
import UIKit
class WallpaperRepository {
    static func getWallapaperList() -> [ImageDataContainer] {
        var wallapaperList = [ImageDataContainer]()
        let tempStr = "fighterPediaBg"
        for count in 1...25 {
            wallapaperList.append(ImageDataContainer(img: "\(tempStr)\(count)",
                                                     uiImage: UIImage(named: "\(tempStr)\(count)")!))
        }
        return wallapaperList
    }
    static func getOperatorsList() -> [ImageDataContainer] {
        var imgList = [ImageDataContainer]()
        imgList.append(ImageDataContainer(img: "germany", uiImage: UIImage(named: "germany")!))
        imgList.append(ImageDataContainer(img: "hungary", uiImage: UIImage(named: "hungary")!))
        imgList.append(ImageDataContainer(img: "italy", uiImage: UIImage(named: "italy")!))
        imgList.append(ImageDataContainer(img: "romania", uiImage: UIImage(named: "romania")!))
        imgList.append(ImageDataContainer(img: "independent state of croatia",
                                          uiImage: UIImage(named: "independent state of croatia")!))
        imgList.append(ImageDataContainer(img: "soviet union", uiImage: UIImage(named: "soviet union")!))
        return imgList
    }
}

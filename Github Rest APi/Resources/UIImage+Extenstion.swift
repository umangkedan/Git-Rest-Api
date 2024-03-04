//
//  UIImage+Extenstion.swift
//  APiDemo
//
//  Created by Umang on 26/02/24.
//

import Foundation
import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit, completion: @escaping (UIImage?) -> Void) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else {
                completion(nil)
                return
            }
            DispatchQueue.main.async() {
                completion(image)
            }
        }.resume()
    }

    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: link) else {
            completion(nil)
            return
        }
        downloaded(from: url, contentMode: mode, completion: completion)
    }
}

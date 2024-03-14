//
//  String+Extension.swift
//  Fresh Wave - Agent
//
//  Created by Aung Kyaw Mon on 13/03/2024.
//

import Foundation

extension String {
    func heightWithConstrainedWidth(attributes: [NSAttributedString.Key: Any], width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: attributes, context: nil)
        return boundingBox.height
    }
    
}

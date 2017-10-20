//
//  TrimWhiteSpace.swift
//  Selfiegram
//
//  Created by Trant Solo on 13.07.17.
//  Copyright © 2017 tuchka. All rights reserved.
//

import UIKit

extension String
{
    func trim() -> String
    {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
}

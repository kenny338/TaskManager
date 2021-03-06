//
//  UINib+Existance.swift
//  DTModelStorage
//
//  Created by Denys Telezhkin on 15.07.15.
//  Copyright (c) 2015 Denys Telezhkin. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation
import UIKit

public extension UINib {
    /// Returns true, if nib file with `nibName` exists in `bundle`.
    public class func nibExists(withNibName nibName :String,
                                           inBundle bundle: Bundle = Bundle.main) -> Bool
    {
        return bundle.path(forResource: nibName, ofType: "nib") != nil
    }
}

public extension UINib {
    @available(*,unavailable,renamed:"nibExists(withNibName:inBundle:)")
    @nonobjc public class func nibExistsWithNibName(_ nibName :String,
                                                    inBundle bundle: Bundle = Bundle.main) -> Bool
    {
        fatalError("UNAVAILABLE")
    }
}

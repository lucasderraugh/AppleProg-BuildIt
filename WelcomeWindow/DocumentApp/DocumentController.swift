//
//  DocumentController.swift
//  DocumentApp
//
//  Created by Lucas Derraugh on 5/7/21.
//

import Cocoa

class DocumentController: NSDocumentController {
    
    var hasOpenedDocument = false

    override func openDocument(withContentsOf url: URL, display displayDocument: Bool, completionHandler: @escaping (NSDocument?, Bool, Error?) -> Void) {
        hasOpenedDocument = true
        super.openDocument(withContentsOf: url, display: displayDocument, completionHandler: completionHandler)
    }
    
    override func reopenDocument(for urlOrNil: URL?, withContentsOf contentsURL: URL, display displayDocument: Bool, completionHandler: @escaping (NSDocument?, Bool, Error?) -> Void) {
        hasOpenedDocument = true
        super.reopenDocument(for: urlOrNil, withContentsOf: contentsURL, display: displayDocument, completionHandler: completionHandler)
    }
}

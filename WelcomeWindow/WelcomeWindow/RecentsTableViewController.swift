//
//  RecentsTableViewController.swift
//  WelcomeWindow
//
//  Created by Lucas Derraugh on 2/25/21.
//

import Cocoa

private let cellIdentifier = NSUserInterfaceItemIdentifier("FileTableCellView")

class RecentsTableViewController: NSViewController {
    
    @IBOutlet private weak var noRecentsLabel: NSTextField!
    @IBOutlet private weak var tableView: NSTableView!
    private var tableViewDS: NSTableViewDiffableDataSource<Int, URL>!
    private let urls: [URL]
    
    init(urls: [URL]) {
        self.urls = urls
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.target = self
        tableView.doubleAction = #selector(doubleAction(_:))
        tableView.register(NSNib(nibNamed: "FileTableCellView", bundle: nil), forIdentifier: cellIdentifier)
        
        tableViewDS = NSTableViewDiffableDataSource<Int, URL>(tableView: tableView, cellProvider: { (tableView, column, section, url) -> NSView in
            guard let cell = tableView.makeView(withIdentifier: cellIdentifier, owner: nil) as? FileTableCellView else {
                return NSView()
            }
            cell.configure(with: url)
            return cell
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Int, URL>()
        snapshot.appendSections([0])
        snapshot.appendItems(urls)
        tableViewDS.apply(snapshot, animatingDifferences: false)
        
        let containsURLs = !urls.isEmpty
        noRecentsLabel.isHidden = containsURLs
        if containsURLs {
            tableView.selectRowIndexes([0], byExtendingSelection: false)
        }
    }
    
    @objc private func doubleAction(_ sender: NSTableView) {
        let selectedRow = sender.selectedRow
        print("Open index: \(selectedRow)")
    }
    
}

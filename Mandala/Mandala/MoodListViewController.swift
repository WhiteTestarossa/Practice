//
//  MoodListViewController.swift
//  Mandala
//
//  Created by Daniel Belokursky on 17.11.21.
//

import UIKit

class MoodListViewController: UITableViewController {
    //MARK: - Public Properties
    var moodEntries: [MoodEntry] = []
    let cellID = "Cell"
    
    
    //MARK: - Data Source Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        moodEntries.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let moodEntry = moodEntries[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellID, for: indexPath)
        cell.imageView?.image = moodEntry.mood.image
        cell.textLabel?.text = "I was \(moodEntry.mood.name)"
        let dateString = DateFormatter.localizedString(from: moodEntry.timestamp, dateStyle: .medium, timeStyle: .short)
        cell.detailTextLabel?.text = "on \(dateString)"
        return cell
    }
    
}

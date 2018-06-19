//
//  PlayersListTableViewController.swift
//  FootballTestApp
//
//  Created by Alexandr Polukhin on 18.06.2018.
//  Copyright © 2018 Alexandr Polukhin. All rights reserved.
//

import UIKit

class PlayersListTableViewController: UITableViewController {

    var team: Team!
    
    @IBAction func EditButtonClicked(_ sender: UIBarButtonItem) {
        self.tableView.setEditing(!self.tableView.isEditing, animated: true)
        let title = self.tableView.isEditing ? "Done" : "Edit"
        self.navigationItem.rightBarButtonItem!.title = title
        self.tableView.isEditing ? self.tableView.beginUpdates() : self.tableView.endUpdates()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var sectionName = String()
        switch section {
        case 0:
            sectionName = playerStatus.general.type()
        case 1:
            sectionName = playerStatus.forReplace.type()
        case 2:
            sectionName = playerStatus.reserve.type()
        default:
            break
        }
        return sectionName
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var countOfRows = Int()
        switch section {
        case 0:
            countOfRows = team.genPlayers.count
        case 1:
            countOfRows = team.playersForReplace.count
        case 2:
            countOfRows = team.reservePlayers.count
        default:
            countOfRows = 0
        }
        return countOfRows
        
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayersListCellID", for: indexPath)

        switch indexPath.section {
        case 0:
            cell.textLabel!.text = team.genPlayers[indexPath.row].name
            cell.detailTextLabel!.text = team.genPlayers[indexPath.row].status.type()
        case 1:
            cell.textLabel!.text = team.playersForReplace[indexPath.row].name
            cell.detailTextLabel!.text = team.playersForReplace[indexPath.row].status.type()
        case 2:
            cell.textLabel!.text = team.reservePlayers[indexPath.row].name
            cell.detailTextLabel!.text = team.reservePlayers[indexPath.row].status.type()
        default:
            break
        }
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var player: Player?
        switch sourceIndexPath.section {
        case 0:
            player = team.genPlayers[sourceIndexPath.row]
            team.genPlayers.remove(at: sourceIndexPath.row)
        case 1:
            player = team.playersForReplace[sourceIndexPath.row]
            team.playersForReplace.remove(at: sourceIndexPath.row)
        case 2:
            player = team.reservePlayers[sourceIndexPath.row]
            team.reservePlayers.remove(at: sourceIndexPath.row)
        default:
            break
        }
        
        switch destinationIndexPath.section {
        case 0:
            player!.status = .general
            team.genPlayers.insert(player!, at: destinationIndexPath.row)
        case 1:
            player!.status = .forReplace
            team.playersForReplace.insert(player!, at: destinationIndexPath.row)
        case 2:
            player!.status = .reserve
            team.reservePlayers.insert(player!, at: destinationIndexPath.row)
        default:
            break
        }
        tableView.reloadRows(at: [destinationIndexPath], with: .none)
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            switch indexPath.section {
            case 0:
                team.genPlayers.remove(at: indexPath.row)
            case 1:
                team.playersForReplace.remove(at: indexPath.row)
            case 2:
                team.reservePlayers.remove(at: indexPath.row)
            default:
                break
            }
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
}

//
//  PlayersListTableViewController.swift
//  FootballTestApp
//
//  Created by Alexandr Polukhin on 18.06.2018.
//  Copyright © 2018 Alexandr Polukhin. All rights reserved.
//

import UIKit

class PlayersListTableViewController: UITableViewController {

    var allPlayers = [Player]()
    
    var genPlayers = [Player]()
    var playersForReplace = [Player]()
    var reservePlayers = [Player]()
    
    func sortByStatus(players: [Player]) {
        for player in players {
            switch player.status {
            case playerStatus.general.type():
                genPlayers.append(player)
            case playerStatus.forReplace.type():
                playersForReplace.append(player)
            case playerStatus.reserve.type():
                reservePlayers.append(player)
            default: break
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        sortByStatus(players: allPlayers)
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var countOfRows = Int()
        switch section {
        case 0:
            countOfRows = genPlayers.count
        case 1:
            countOfRows = playersForReplace.count
        case 2:
            countOfRows = reservePlayers.count
        default:
            countOfRows = 0
        }
        return countOfRows
        
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

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayersListCellID", for: indexPath)

        switch indexPath.section {
        case 0:
            cell.textLabel!.text = genPlayers[indexPath.row].name
            cell.detailTextLabel!.text = genPlayers[indexPath.row].status
        case 1:
            cell.textLabel!.text = playersForReplace[indexPath.row].name
            cell.detailTextLabel!.text = playersForReplace[indexPath.row].status
        case 2:
            cell.textLabel!.text = reservePlayers[indexPath.row].name
            cell.detailTextLabel!.text = reservePlayers[indexPath.row].status
        default:
            break
        }

        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

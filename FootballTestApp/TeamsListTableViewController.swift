//
//  TeamsListTableViewController.swift
//  FootballTestApp
//
//  Created by Alexandr Polukhin on 18.06.2018.
//  Copyright © 2018 Alexandr Polukhin. All rights reserved.
//

import UIKit

class TeamsListTableViewController: UITableViewController {

    var teams = [Team]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...9 {
            let team = Team(name: "Team \(i)")
            teams.append(team)
            
            for j in 0...9 {
                let player = Player(name: "T\(i) Player \(j)", status: playerStatus.random())
            teams[i].players.append(player)
            }
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showTeamPlayersSegueID") {
            let playersViewController:PlayersListTableViewController = segue.destination as! PlayersListTableViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            let team = teams[indexPath!.row]
            playersViewController.allPlayers = team.players
            self.tableView.deselectRow(at: indexPath!, animated: true)
        }
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamsListCellID", for: indexPath)

        cell.textLabel!.text = teams[indexPath.row].name
        cell.detailTextLabel!.text = String(teams[indexPath.row].players.count)

        return cell
    }
    
    
    // MARK: - Table Delagate
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "showTeamPlayersSegueID", sender: self)
//    }
    

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

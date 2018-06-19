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
        createTeamsAndPlayers()
    }
    
    func createTeamsAndPlayers() {
        for i in 0...9 {
            let team = Team(name: "Team \(i)")
            for j in 0...9 {
                let player = Player(name: "T\(i) Player \(j)", status: playerStatus.random())
                switch player.status {
                case playerStatus.general:
                    team.genPlayers.append(player)
                case playerStatus.forReplace:
                    team.playersForReplace.append(player)
                case playerStatus.reserve:
                    team.reservePlayers.append(player)
                }
            }
            teams.append(team)
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

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showTeamPlayersSegueID") {
            let playersViewController:PlayersListTableViewController = segue.destination as! PlayersListTableViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            let team = teams[indexPath!.row]
            playersViewController.team = team
            playersViewController.navigationItem.title = team.name
            self.tableView.deselectRow(at: indexPath!, animated: true)
        }
    }

}

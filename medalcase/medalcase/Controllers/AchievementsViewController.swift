//
//  ViewController.swift
//  medalcase
//
//  Created by Luiz Peres on 2021-10-23.
//

import UIKit

internal class AchievementsViewController: UIViewController {

    @IBOutlet weak var achievementsGridView: UICollectionView!
    private let user = SessionUser.sessionUserExercise
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        setupDelegates()
    }

    func setupNavBar() {
        // In case we had other views I could do it in a more generic way
        self.navigationController?.navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
    
    func setupDelegates() {
        self.achievementsGridView.delegate = self
        self.achievementsGridView.dataSource = self
        let layout = self.achievementsGridView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.sectionHeadersPinToVisibleBounds = true
    }
}

extension AchievementsViewController : UICollectionViewDataSource {
    
    private func filteredGroup(section: Int) -> [Achievement] {
        let group = self.user.achievements.filter { achievement in
            return achievement.group.rawValue == section
        }

        return group
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Achievement.Group.allCases().count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredGroup(section: section).count
    }
}

extension AchievementsViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView .dequeueReusableCell(withReuseIdentifier: "medalIdentifier", for: indexPath) as! MedalViewCell
        let group = filteredGroup(section: indexPath.section)
        let achievement = group[indexPath.row]
        cell.setup(title: achievement.name,
                   subtitle: achievement.details,
                   iconName: achievement.iconName,
                   achieved: achievement.achieved)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:collectionView.frame.size.width, height:HeaderView.desiredHeight)
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                   withReuseIdentifier: "sectionIdentifier",
                                                                   for: indexPath) as! HeaderView
        let section = indexPath.section
        if (section == Achievement.Group.VirtualRaces.rawValue) {
            view.setup(title: String.localized(forKey: "virtual_races"),
                       color: ColorTheme.headerLightGray)
        } else {
            let group = self.filteredGroup(section: section)
            let partNum = group.filter { $0.achieved }
            let ofStr = String.localized(forKey: "of")
            let subtitle = "\(partNum.count) \(ofStr) \(group.count)"
            view.setup(title: String.localized(forKey: "personal_records"),
                       subtitle: subtitle,
                       color: ColorTheme.headerLightGray)
        }
        return view
    }
}
    


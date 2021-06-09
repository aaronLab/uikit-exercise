//
//  PlayerViewController.swift
//  CompleteAutoLayout
//
//  Created by Aaron Lee on 2021/06/09.
//

import UIKit
import SnapKit
import VersaPlayer

class PlayerViewController: UIViewController {
    
    // MARK: - Public Properties
    
    /// Player
    let playerView = VersaPlayerView()
    let controls = VersaPlayerControls()
    let playBtn = VersaStatefulButton()
    
    
    let subView = UIView()
    
    // MARK: - Private Properties
    
    private let url = URL(string: "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/360/Big_Buck_Bunny_360_10s_1MB.mp4")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        
        view.backgroundColor = .white
        
        playerView.use(controls: controls)
        
        view.addSubview(playerView)
        playerView.backgroundColor = .white
        playerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        let config = UIImage.SymbolConfiguration(pointSize: 40, weight: .bold)
        let img1 = UIImage(systemName: "play.circle.fill", withConfiguration: config)
        let img2 = UIImage(systemName: "playpause.fill", withConfiguration: config)
        playBtn.activeImage = img1
        playBtn.inactiveImage = img2
        playBtn.addTarget(controls, action: #selector(controls.togglePlayback(sender:)), for: .touchUpInside)
        
        controls.addSubview(playBtn)
        
        playBtn.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        playerView.addSubview(controls)
        controls.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        
        let item = VersaPlayerItem(url: url)
        playerView.set(item: item)
        
        
    }
    
}

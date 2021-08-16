//
//  PlayerControlsView.swift
//  Spotify
//
//  Created by Bryan Guerra on 6/28/21.
//

import Foundation
import UIKit
protocol PlayerControlsViewDelegate: AnyObject {
    func playerControlsViewDidTapPlayPause(_ playerControlsView: PlayerControlsView)
    func playerControlsViewDidTapFoward(_ playerControlsView: PlayerControlsView)
    func playerControlsViewDidTapBackwards(_ playerControlsView: PlayerControlsView)
    
}

final class PlayerControlsView: UIView {
    weak var delegate: PlayerControlsViewDelegate?
    
    private let volumeSlider: UISlider = {
       let slider = UISlider()
        slider.value = 0.5
        return slider
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "This is my song"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "Drake ft. Silver"
        label.font = .systemFont(ofSize: 18, weight: .regular )
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let backButton: UIButton = {
       let button = UIButton()
        button.tintColor = .label
        let image = UIImage(systemName: "backward.end.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 34, weight: .regular))
        button.setImage(image, for: .normal)
        return button
    }()
    
    private let playPauseButton: UIButton = {
       let button = UIButton()
        button.tintColor = .label
        let image = UIImage(systemName: "pause.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 34, weight: .regular))
        button.setImage(image, for: .normal)
        return button
    }()
    
    private let nextButton: UIButton = {
       let button = UIButton()
        button.tintColor = .label
        let image = UIImage(systemName: "forward.end.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 34, weight: .regular))
        button.setImage(image, for: .normal)
        return button
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(nameLabel)
        addSubview(subtitleLabel)
        addSubview(volumeSlider)
        addSubview(backButton)
        addSubview(nextButton)
        addSubview(playPauseButton)
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(didTapNext), for: .touchUpInside)
        playPauseButton.addTarget(self, action: #selector(didTapPlayPause), for: .touchUpInside)
        
        clipsToBounds = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc private func didTapBack(){
        delegate?.playerControlsViewDidTapBackwards(self)
    }
  
    @objc private func didTapNext(){
        delegate?.playerControlsViewDidTapFoward(self)
    }
    
    @objc private func didTapPlayPause(){
        delegate?.playerControlsViewDidTapPlayPause(self)
    }
    
    override func layoutSubviews() {
        nameLabel.frame = CGRect(x: 0, y: 0, width: width, height: 50)
        subtitleLabel.frame = CGRect(x: 0, y: nameLabel.bottom+10, width: width, height: 50)
        volumeSlider.frame = CGRect(x: 10, y: subtitleLabel.bottom+20, width: width-20, height: 44)
        let btnSize: CGFloat = 60
        
        playPauseButton.frame = CGRect(x: (width-btnSize)/2, y: volumeSlider.bottom+30, width:btnSize, height: btnSize)
        backButton.frame = CGRect(x: playPauseButton.left-80, y: playPauseButton.top, width:btnSize, height: btnSize)
        nextButton.frame = CGRect(x: playPauseButton.left+80, y: playPauseButton.top, width:btnSize, height: btnSize)
    }
    
}

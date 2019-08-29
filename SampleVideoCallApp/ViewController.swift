//
//  ViewController.swift
//  SampleVideoCallApp
//
//  Created by Manish Kumar on 14/12/17.
//  Copyright © 2017 Innofied. All rights reserved.
//

import UIKit
import TwilioVideo

class ViewController: UIViewController {
    
    //MANISH PHONE
//    let accessToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImN0eSI6InR3aWxpby1mcGE7dj0xIn0.eyJqdGkiOiJTSzJhMzA5OTU1YmUxM2IwY2U1MmQyMWEzMGMzNGI0YTFjLTE1NjcwNjM2OTIiLCJpc3MiOiJTSzJhMzA5OTU1YmUxM2IwY2U1MmQyMWEzMGMzNGI0YTFjIiwic3ViIjoiQUMxZTZhNDhkYmRjZWIyZjU4YTdmNDMzYWRhNDk5ZWEzMyIsImV4cCI6MTU2NzA2NzI5MiwiZ3JhbnRzIjp7ImlkZW50aXR5IjoiTWFuaXNoIiwidmlkZW8iOnsicm9vbSI6ImNvbS5pbm5vZmllZC5TYW1wbGVWaWRlb0NhbGxBcHAifX19.ZUR0tmIHxccmTIJZ9mYCt2kvFFNTp_TlSYE2BP_YEjw"
    
    
    //CLIENT PHONE
    let accessToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImN0eSI6InR3aWxpby1mcGE7dj0xIn0.eyJqdGkiOiJTSzJhMzA5OTU1YmUxM2IwY2U1MmQyMWEzMGMzNGI0YTFjLTE1NjcwNjM3MjgiLCJpc3MiOiJTSzJhMzA5OTU1YmUxM2IwY2U1MmQyMWEzMGMzNGI0YTFjIiwic3ViIjoiQUMxZTZhNDhkYmRjZWIyZjU4YTdmNDMzYWRhNDk5ZWEzMyIsImV4cCI6MTU2NzA2NzMyOCwiZ3JhbnRzIjp7ImlkZW50aXR5IjoiQ2xpZW50IiwidmlkZW8iOnsicm9vbSI6ImNvbS5pbm5vZmllZC5TYW1wbGVWaWRlb0NhbGxBcHAifX19.mPmhQ_1ZXCcP_TwHYX9JxmXYNkxvyJN7t-eNPSloWnE"
    

    
    var room : TVIRoom?
    var camera: TVICameraSource?

    // Create an audio track
    var localAudioTrack = TVILocalAudioTrack()
    
    // Create a data track
    var localDataTrack = TVILocalDataTrack()
    
    // Create a CameraSource to provide content for the video track
    var localVideoTrack : TVILocalVideoTrack?

    
    @IBOutlet weak var remoteView: TVIVideoView!
    @IBOutlet weak var previewView: TVIVideoView!
    
    @IBOutlet weak var topConstraintForPreviewView: NSLayoutConstraint!//0
    @IBOutlet weak var leadingConstraintForPreviewView: NSLayoutConstraint!//16
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        startPreview()
    }

    // MARK: Private
    func startPreview() {
        if let camera = TVICameraCapturer(source: .frontCamera),let videoTrack = TVILocalVideoTrack(capturer: camera) {
            
            // Add renderer to the video track
            videoTrack.addRenderer(previewView)
            self.localVideoTrack = videoTrack
            //self.camera = camera
        } else {
            print("Couldn't create CameraCapturer or LocalVideoTrack")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @IBAction func createRoom(_ sender: UIButton) {
        
        let connectOptions = TVIConnectOptions.init(token: accessToken) { (builder) in
            builder.roomName = "com.innofied.SampleVideoCallApp"
            
            if let audioTrack = self.localAudioTrack {
                builder.audioTracks = [ audioTrack ]
            }
            if let videoTrack = self.localVideoTrack {
                builder.videoTracks = [ videoTrack ]
            }
        }
        room = TwilioVideo.connect(with: connectOptions, delegate: self)
    }
    
    @IBAction func leaveRoom(_ sender: UIButton) {
        
        guard let roomToDisconnect = room else{
            return
        }
        
        roomToDisconnect.disconnect()
        
        //animate preview view
        UIView.animate(withDuration: 0.25) {
            self.topConstraintForPreviewView.constant = 0.0
            self.leadingConstraintForPreviewView.constant = 16.0
            self.view.layoutIfNeeded()
        }

    }
    
    
    @IBAction func joinRoom(_ sender: UIButton) {
        
        let connectOptions = TVIConnectOptions.init(token: accessToken) { (builder) in
            builder.roomName = "com.innofied.SampleVideoCallApp"
            
            if let audioTrack = self.localAudioTrack {
                builder.audioTracks = [ audioTrack ]
            }
            if let videoTrack = self.localVideoTrack {
                builder.videoTracks = [ videoTrack ]
            }
        }
        room = TwilioVideo.connect(with: connectOptions, delegate: self)
    }
    
    
}

// MARK: TVIRoomDelegate
extension ViewController: TVIRoomDelegate{
    func didConnect(to room: TVIRoom) {
        
        if let localParticipant = room.localParticipant {
            print("Local identity \(localParticipant.identity)")
        }
        
        // Connected participants
        let participants = room.remoteParticipants;
        print("Number of connected Participants \(participants.count)")

        for participant in participants{
            print("participant identity : \(participant.identity)")
            participant.delegate = self
        }
    }
    
    
    func room(_ room: TVIRoom, participantDidDisconnect participant: TVIRemoteParticipant) {
        print ("Participant \(participant.identity) has left Room \(room.name)")
        
        //animate preview view
        UIView.animate(withDuration: 0.25) {
            self.topConstraintForPreviewView.constant = 0.0
            self.leadingConstraintForPreviewView.constant = 16.0
            self.view.layoutIfNeeded()
        }

    }

    func room(_ room: TVIRoom, participantDidConnect participant: TVIRemoteParticipant) {
        print ("Participant \(participant.identity) has joined Room \(room.name)")
        participant.delegate = self
    }
}

// MARK: TVIParticipantDelegate
extension ViewController: TVIRemoteParticipantDelegate{
    
    func subscribed(to videoTrack: TVIRemoteVideoTrack, publication: TVIRemoteVideoTrackPublication, for participant: TVIRemoteParticipant) {
        
        print("Participant \(participant.identity) added a video track.")
    
        self.remoteView.delegate = self
        videoTrack.addRenderer(remoteView!)
        
        //animate preview view
        UIView.animate(withDuration: 0.25) {
            self.topConstraintForPreviewView.constant = 300
            self.leadingConstraintForPreviewView.constant = 200.0
            self.view.layoutIfNeeded()
        }
    }
    
    
    // Lastly, we can subscribe to important events on the VideoView
    func videoViewDimensionsDidChange(view: TVIVideoView, dimensions: CMVideoDimensions) {
        print("The dimensions of the video track changed to: \(dimensions.width)x\(dimensions.height)")
        self.view.setNeedsLayout()
    }

}

// MARK: TVIVideoViewDelegate
extension ViewController: TVIVideoViewDelegate{
    
    func videoView(_ view: TVIVideoView, videoDimensionsDidChange dimensions: CMVideoDimensions) {
        print("The dimensions of the video track changed to: \(dimensions.width)x\(dimensions.height)")
        self.view.setNeedsLayout()
    }

}

// MARK: TVICameraCapturerDelegate
extension ViewController : TVICameraSourceDelegate {
    
    
}




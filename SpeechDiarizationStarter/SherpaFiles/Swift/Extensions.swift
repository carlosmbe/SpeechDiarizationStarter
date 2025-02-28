//
//  Extensions.swift
//  SpeechDiarizationStarter
//
//  Created by Carlos Mbendera on 28/02/2025.
//

import AVFoundation

extension AudioBuffer {
    func array() -> [Float] {
        return Array(UnsafeBufferPointer(self))
    }
}

extension AVAudioPCMBuffer {
    func array() -> [Float] {
        return self.audioBufferList.pointee.mBuffers.array()
    }
}

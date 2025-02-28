//
//  ViewModel.swift
//  SpeechDiarizationStarter
//
//  Created by Carlos Mbendera on 28/02/2025.
//

import AVFoundation

import Foundation

class SDViewModel : ObservableObject{
    
    let segmentationModel = getResource("SpeechModel", "onnx")
    let embeddingExtractorModel = getResource("3dspeaker_speech_eres2net_base_sv_zh-cn_3dspeaker_16k", "onnx")
 
    
    func runDiarization(waveFileName: String, numSpeakers: Int = 0, fullPath: URL? = nil)  async -> [SherpaOnnxOfflineSpeakerDiarizationSegmentWrapper] {
       
        let waveFilePath = fullPath?.path ?? getResource(waveFileName, "wav")
        
        var config = sherpaOnnxOfflineSpeakerDiarizationConfig(
                segmentation: sherpaOnnxOfflineSpeakerSegmentationModelConfig(
                pyannote: sherpaOnnxOfflineSpeakerSegmentationPyannoteModelConfig(model: segmentationModel)),
                embedding: sherpaOnnxSpeakerEmbeddingExtractorConfig(model: embeddingExtractorModel),
                clustering: sherpaOnnxFastClusteringConfig(numClusters: numSpeakers)
        )
        
        let sd = SherpaOnnxOfflineSpeakerDiarizationWrapper(config: &config)

        let fileURL: NSURL = NSURL(fileURLWithPath: waveFilePath)
        let audioFile = try! AVAudioFile(forReading: fileURL as URL)

        let audioFormat = audioFile.processingFormat
        assert(Int(audioFormat.sampleRate) == sd.sampleRate)
        assert(audioFormat.channelCount == 1)
        assert(audioFormat.commonFormat == AVAudioCommonFormat.pcmFormatFloat32)

        let audioFrameCount = UInt32(audioFile.length)
        let audioFileBuffer = AVAudioPCMBuffer(pcmFormat: audioFormat, frameCapacity: audioFrameCount)

        try! audioFile.read(into: audioFileBuffer!)
        let array: [Float]! = audioFileBuffer?.array()
        
        print("Started!")
        
        //Original was not async
      //  let segments = sd.process(samples: array)
        let segments = await Task.detached(priority: .background) {
               return sd.process(samples: array)
           }.value
        
        for i in 0..<segments.count {
          print("\(segments[i].start) -- \(segments[i].end) speaker_\(segments[i].speaker)")
        }
        
        return segments
    }
    
}

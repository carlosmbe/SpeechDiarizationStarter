//
//  ContentView.swift
//  SpeechDiarizationStarter
//
//  Created by Carlos Mbendera on 27/02/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var SpeechViewModel = SDViewModel()
    @State private var speechResults = "Result of Speech Diarrization Will Go Here"
    
    //MARK: VERY IMPORTANT THAT YOU PUT A VALID RESOURCE HERE. This is just a placeholder
    @State private var mediaURL: URL? = Bundle.main.url(forResource: "Clip", withExtension: "mp4")

    @State var convertedAudioURL: URL? = nil
    
    
    var body: some View {
        VStack {
            Button("Convert Video to Audio") {
                Task{
                    if let mediaURL{
                        convertedAudioURL = try? await convertMediaToMonoFloat32WAV(
                            inputURL: mediaURL)
                    }
                }
            }
            Text("Converted URL Is \(String(describing: convertedAudioURL))")
            
            
            Button("Run Diarization on Converted Audio") {
                Task{
                    if let convertedAudioURL{
                        let fileName = convertedAudioURL.deletingPathExtension().lastPathComponent
                        speechResults = await "\(SpeechViewModel.runDiarization(waveFileName: fileName, fullPath: convertedAudioURL))"
                    }
                }
            }
       
            Text(speechResults)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


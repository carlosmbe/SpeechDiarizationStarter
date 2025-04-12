//
//  ContentView.swift
//  SpeechDiarizationStarter
//
//  Created by Carlos Mbendera on 27/02/2025.
//

import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    
    @ObservedObject private var SpeechViewModel = SDViewModel()
    @State private var speechResults = "Result of Speech Diarrization Will Go Here"
    
    //MARK: If you don't want to pick a file, you can add a file to your bundle and hardcode it to MediaURL as shown in the commented out line
   // @State private var mediaURL: URL? = Bundle.main.url(forResource: "Clip", withExtension: "mp4")
    @State private var mediaURL: URL? = nil
    @State var convertedAudioURL: URL? = nil
    @State private var showingFileImporter = false
    
    var body: some View {
        VStack(spacing: 10) {
            
            Button("Select File with Audio") {
                showingFileImporter = true
            }
            .fileImporter(
                isPresented: $showingFileImporter,
                allowedContentTypes: [UTType.audio, UTType.movie, UTType.video],
                allowsMultipleSelection: false
            ) { result in
                do {
                    let selectedFiles = try result.get()
                    
                    if let url = selectedFiles.first {   mediaURL = url  }
                } catch {
                    print("Failed to import file: \(error.localizedDescription)")
                }
            }
            
            if let url = mediaURL {
                Text("Selected File: \(url.lastPathComponent)")
            } else {
                Text("No file selected")
            }
            
            
            Button("Convert Video to Audio") {
                Task{
                    if let mediaURL{
                        convertedAudioURL = try? await convertMediaToMonoFloat32WAV(
                            inputURL: mediaURL)
                    }
                }
            }
            .disabled(mediaURL == nil)
            
            Text("Converted URL Is \(String(describing: convertedAudioURL))")
            
            Button("Run Diarization on Converted Audio") {
                Task{
                    if let convertedAudioURL{
                        let fileName = convertedAudioURL.deletingPathExtension().lastPathComponent
                        speechResults = await "\(SpeechViewModel.runDiarization(waveFileName: fileName, fullPath: convertedAudioURL))"
                    }
                }
            }
            .disabled(convertedAudioURL == nil)
            
            if SpeechViewModel.running {
                ProgressView()
            }
            
            Text(speechResults)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


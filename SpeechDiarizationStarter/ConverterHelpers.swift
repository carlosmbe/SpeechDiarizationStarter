//
//  ConverterHelpers.swift
//  SpeechDiarizationStarter
//
//  Created by Carlos Mbendera on 28/02/2025.
//

import AudioKit
import Foundation

/// Converts a medai file at the given URL to a 16 kHz, mono, 32‑bit float WAV file using AudioKit’s FormatConverter.
/// - Parameter inputURL: The URL of the source file.
/// - Returns: The URL of the newly converted WAV file.
/// - Throws: An error if conversion fails.
func convertMediaToMonoFloat32WAV(inputURL: URL) async throws -> URL {
    // Build the output WAV URL in the Documents directory.
    let finalWAVURL = try makeWavOutputURL(for: inputURL)
    
    // Set up conversion options.
    var options = FormatConverter.Options()
    options.format = .wav
    //The Speech Model Expects A Sample Rate of 16000 and a mono file
    options.sampleRate = 16000
    options.bitDepth = 32
    options.channels = 1
    
    // Create the converter.
    let converter = FormatConverter(inputURL: inputURL, outputURL: finalWAVURL, options: options)
    
    converter.start(completionHandler: { error in
              if let error = error {
                  print("Error during convertion: \(error)")
              } else {
                  print("Conversion Complete!")
              }
          })
    
    return finalWAVURL
}

/// Helper: Builds a .wav output URL in the Documents directory based on the input file’s name.
private func makeWavOutputURL(for inputURL: URL) throws -> URL {
    let baseName = inputURL.deletingPathExtension().lastPathComponent
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyyMMdd"
    let dateString = formatter.string(from: Date())
    
    let fileName = "converted_\(dateString)_\(baseName).wav"
    guard let documentsDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
        throw NSError(domain: "FileConversion", code: -1,
                      userInfo: [NSLocalizedDescriptionKey: "Could not locate Documents directory"])
    }
    return documentsDir.appendingPathComponent(fileName)
}

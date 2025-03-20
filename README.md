# SwiftUI Speech Diarization Example (Work in Progress)

**Note:** This project is currently under development and this README is incomplete.

## Project Overview

This repository aims to refactor and simplify the SwiftUI example provided by [k2-fsa/sherpa-onnx](https://github.com/k2-fsa/sherpa-onnx), specifically focusing on Speech Diarization.

## Getting Started

If you clone and attempt to build this project immediately, you will encounter errors due to the absence of the required `onnxruntime` framework, which is too large to include directly in this repository.

If you'd like to test the app. Please add a file titled "`Clip.mp4`" or change line 16 in ContentView


### Download Required Framework

You can download the `onnxruntime` framework from the following link:

[Download onnxruntime.xcframework-1.17.1.tar.bz2](https://github.com/csukuangfj/onnxruntime-libs/releases/download/v1.17.1/onnxruntime.xcframework-1.17.1.tar.bz2)

Extract the downloaded archive and copy the `onnxruntime.xcframework` to your Xcode project directory.

### Alternative Method

Alternatively, you can clone the original [k2-fsa/sherpa-onnx](https://github.com/k2-fsa/sherpa-onnx) repository and follow its detailed [build instructions](https://k2-fsa.github.io/sherpa/onnx/ios/build-sherpa-onnx-swift.html).

## Contributing

Contributions and suggestions are welcome as the project is actively evolving.

---

Updates and additional documentation will be provided as development progresses.

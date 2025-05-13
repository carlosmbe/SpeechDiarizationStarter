# SwiftUI Speech Diarization Example 

**Note:** This project is currently under development and this README will be periodcally updated.

## Project Overview

This repository aims to refactor and simplify the SwiftUI example provided by [k2-fsa/sherpa-onnx](https://github.com/k2-fsa/sherpa-onnx), specifically focusing on Speech Diarization.

I wrote a [companion article](https://carlosmbe.hashnode.dev/running-speech-models-with-swift-using-sherpa-onnx-for-apple-development) breaking down how and why I built this project.

Additionally, I recently created an algorithm for [Active Speaker Detection](https://github.com/carlosmbe/ActiveSpeakerDetectionStarter) using this project as a base. 
## Getting Started

### 1. Required Frameworks

Before building this project, ensure the required frameworks are in place:

- **`onnxruntime`** is too large to be included directly. You must [download it manually](#download-required-framework).
- **`Sherpa-Onnx.xcframework`** must also be built and added to your project. See [Building from Sherpa Onnx](#building-from-sherpa-onnx).

Without these, building the project will fail.

> **Note:** After setup, test the app using the File Picker to load an audio file. Alternatively, hardcode a file path in `ContentView` (line 18) for testing.

---

### Download Required Framework

Download the `onnxruntime` framework:

[onnxruntime.xcframework-1.17.1.tar.bz2](https://github.com/csukuangfj/onnxruntime-libs/releases/download/v1.17.1/onnxruntime.xcframework-1.17.1.tar.bz2)

**Steps:**
1. Extract the archive.
2. Copy `onnxruntime.xcframework` into your Xcode project directory.

---

### Building from Sherpa Onnx

To build `Sherpa-Onnx.xcframework`, follow these steps:

Visit this link for more detailed [build instructions](https://k2-fsa.github.io/sherpa/onnx/ios/build-sherpa-onnx-swift.html).

#### Summary of Build Steps
1. Clone the reposity 
   ```bash
    git clone https://github.com/k2-fsa/sherpa-onnx 
2. Enter the repo directory
    ```bash
    cd sherpa-onnx
   
3. Run the ios build script with
    ```bash
    ./build-ios.sh
   
4. After the script completes, a `build-ios` folder will be created.

5. Copy `sherpa-onnx.xcframework` from build-ios into your Xcode project.

6. You’ll also find `onnxruntime.xcframework` in:
    ```bash
    ios-onnxruntime/1.17.1/onnxruntime.xcframework
> This is the same xcframework from the previous section 
   
<img width="334" alt="Screenshot of files to copy" src="https://github.com/user-attachments/assets/aa1504b1-019f-4d49-8756-86d7915c3421" />

## The Actual App

The App requires you to select an Audio/Video file via File Picker. Alternatively, you can change `line 18` in `ContentView` to hardcode a file in your bundle for testing.

It then converts it to a format that the speech diarization model accepts

Afterwards, run the model and the results will eventually replace the placehodler text

https://github.com/user-attachments/assets/554b8154-c580-409a-958c-81aaca0c3a21

## Contributing

Contributions and suggestions are welcome as the project is actively evolving.

---

Updates and additional documentation will be provided as development progresses.

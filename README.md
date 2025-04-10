# SwiftUI Speech Diarization Example 

**Note:** This project is currently under development and this README will be periodcally updated.

## Project Overview

This repository aims to refactor and simplify the SwiftUI example provided by [k2-fsa/sherpa-onnx](https://github.com/k2-fsa/sherpa-onnx), specifically focusing on Speech Diarization.

I wrote a [companion article](https://carlosmbe.hashnode.dev/running-speech-models-with-swift-using-sherpa-onnx-for-apple-development) breaking down how and why I built this project.


## Getting Started

If you clone and attempt to build this project immediately, you will encounter errors due to the absence of the required `onnxruntime` framework, which is too large to include directly in this repository.

If after adding the `onnxruntime` framework, you encounter an error saying folder `ios-arm64` or `ios-arm64_x86_64-simulator` dones't exist. You will need to rebuild and replace `Sherpa-Onnx.xcframework`. Follow the steps in **Building Directly From Sherpa Onnx**

After getting a successful build. You can test the app by adding a file titled "`Clip.mp4`" or changing line 16 in `ContentView`

### Download Required Framework

You can download the `onnxruntime` framework from the following link:

[Download onnxruntime.xcframework-1.17.1.tar.bz2](https://github.com/csukuangfj/onnxruntime-libs/releases/download/v1.17.1/onnxruntime.xcframework-1.17.1.tar.bz2)

Extract the downloaded archive and copy the `onnxruntime.xcframework` to your Xcode project directory.

### Building Directly From Sherpa Onnx

Clone the original [k2-fsa/sherpa-onnx](https://github.com/k2-fsa/sherpa-onnx) repository and follow its detailed [build instructions](https://k2-fsa.github.io/sherpa/onnx/ios/build-sherpa-onnx-swift.html).

#### Summary of Build Steps
1. Clone the reposity `git clone https://github.com/k2-fsa/sherpa-onnx`
2. Enter the repo directory `cd sherpa-onnx`
3. Run the ios build script with `./build-ios.sh`
4. After the script completes, there will be a new folder named `build-ios`
5. Copy `sherpa-onnx.xcframework` to your XCode project
6. The `onnxruntime.xcframework` here in this folder is the same as the one from the last section, so if you haven't downloaded it. Copy it from `ios-onnxruntime -> 1.17.1 -> onnxruntime.xcframework`

<img width="334" alt="Screenshot 2025-04-10 at 1 01 38 PM" src="https://github.com/user-attachments/assets/aa1504b1-019f-4d49-8756-86d7915c3421" />


## Contributing

Contributions and suggestions are welcome as the project is actively evolving.

---

Updates and additional documentation will be provided as development progresses.
